EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

inherit meson python-single-r1

DESCRIPTION="Bubblewrap based sandboxing for desktop applications"
HOMEPAGE="https://github.com/igo95862/bubblejail"
SRC_URI="https://github.com/igo95862/bubblejail/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="docs bash-completion fish slirp4netns"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPEND="dev-python/jinja2
    docs? ( app-text/scdoc )"

DEPEND="dev-lang/python
    dev-python/pyxdg
    dev-python/tomli-w
    dev-python/cattrs
    sys-apps/bubblewrap
    sys-apps/xdg-dbus-proxy
    dev-python/pyqt6
    sys-libs/libseccomp
    dev-python/python-lxns"

RDEPEND="${DEPEND}
    dev-util/desktop-file-utils
    x11-libs/libnotify
    slirp4netns? ( app-containers/slirp4netns )"

pkg_setup() {
	python-single-r1_pkg_setup || die
}

src_configure() {
	local emesonargs=(
		$(meson_use docs man)
	)
	meson_src_configure || die
}

src_install() {
	local INSTALL_TAGS="runtime,bubblejail-gui"
	use docs && INSTALL_TAGS+=",man"
	use bash-completion && INSTALL_TAGS+=",bash-completion"
	use fish && INSTALL_TAGS+=",fish-completion"

	meson_src_install --tags "${INSTALL_TAGS}" || die
	python_optimize || die
}
