EAPI=8

inherit cmake

DESCRIPTION="User-friendly C++ library for GPU accelerated linear algebra, integrating with CUDA and OpenCL"
HOMEPAGE="https://gitlab.com/bandicoot-lib/bandicoot-code"
SRC_URI="https://gitlab.com/bandicoot-lib/bandicoot-code/-/archive/${PV}/bandicoot-code-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0/3"
KEYWORDS="amd64 ~x86"
IUSE="cuda opencl"
REQUIRED_USE="|| ( cuda opencl )"

# TODO: cuda
RDEPEND="virtual/blas
	virtual/lapack
	cuda? ( dev-util/nvidia-cuda-toolkit dev-libs/cudart sci-libs/cublas sci-libs/curand sci-libs/cusolver )
	opencl? ( sci-libs/clblast )"

DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${P}.tar.gz
	mv bandicoot-code-${PV} ${P}
}
