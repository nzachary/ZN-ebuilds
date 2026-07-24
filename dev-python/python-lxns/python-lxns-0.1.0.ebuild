EAPI=8

PYTHON_COMPAT=( python3_{9..14} )

inherit meson python-single-r1

DESCRIPTION="Python library to control Linux kernel namespaces"
HOMEPAGE="https://github.com/igo95862/python-lxns"
SRC_URI="https://github.com/igo95862/python-lxns/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="dev-lang/python"

RDEPEND="${DEPEND}"

pkg_setup() {
	python-single-r1_pkg_setup
}
