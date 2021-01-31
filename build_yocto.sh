sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 xterm

if [ -d "bin/repo" ]; then echo "repo already downloaded"; else mkdir -p bin; curl https://storage.googleapis.com/git-repo-downloads/repo > bin/repo; chmod a+x bin/repo; fi
export PATH=$PATH:bin

mkdir -p imx-yocto-bsp && cd imx-yocto-bsp
repo init -u https://source.codeaurora.org/external/imx/imx-manifest -b imx-linux-zeus -m imx-5.4.70-2.3.0.xml
repo sync

DISTRO=fsl-imx-fb MACHINE=imx6ull14x14evk source imx-setup-release.sh -b yocto-nxp-MCIMX6ULL-EVK
bitbake core-image-base

