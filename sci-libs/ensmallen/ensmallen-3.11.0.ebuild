EAPI=8

inherit cmake

DESCRIPTION="A header-only C++ library for numerical optimization"
HOMEPAGE="https://github.com/mlpack/ensmallen"
SRC_URI="https://github.com/mlpack/ensmallen/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0/3"
KEYWORDS="amd64 ~x86"
IUSE="bandicoot"

RDEPEND="sci-libs/armadillo
	bandicoot? ( sci-libs/bandicoot )"

DEPEND="${RDEPEND}"
