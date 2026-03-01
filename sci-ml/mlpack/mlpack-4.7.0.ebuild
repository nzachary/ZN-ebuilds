EAPI=8

inherit cmake

DESCRIPTION="A fast, header-only C++ machine learning library"
HOMEPAGE="https://github.com/mlpack/mlpack"
SRC_URI="https://github.com/mlpack/mlpack/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0/3"
KEYWORDS="amd64 ~x86"
IUSE="test bandicoot +cli"

RDEPEND="sci-libs/ensmallen[bandicoot?]
	dev-libs/cereal
	sci-libs/armadillo
	bandicoot? ( sci-libs/bandicoot )"

DEPEND="${RDEPEND}"

RESTRICT="!test? ( test )"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_LIBDIR="${EPREFIX}/usr/$(get_libdir)"
        )

	if use test; then
		mycmakeargs+=(
			-DBUILD_TESTS=ON
		)
	fi

	if ! use cli; then
		mycmakeargs+=(
			-DBUILD_CLI_EXECUTABLES=OFF
		)
	fi

	cmake_src_configure
}

src_test() {
	cmake_src_test || die
	./bin/mlpack_test || die
}
