EAPI=8

DESCRIPTION="The \"Activate Windows\" watermark ported to Linux"
HOMEPAGE="https://github.com/MrGlockenspiel/activate-linux"
SRC_URI="https://github.com/MrGlockenspiel/activate-linux/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

RDEPEND="x11-libs/cairo
	x11-libs/libXi
	x11-libs/libX11
	x11-libs/libXt
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXinerama
	x11-apps/xrandr
	dev-libs/wayland
	dev-libs/wayland-protocols"

DEPEND="${RDEPEND}"

src_install() {
	newbin activate-linux activate-linux
	newman activate-linux.1 activate-linux.1
}

pkg_postrm() {
	mandb -q
}
