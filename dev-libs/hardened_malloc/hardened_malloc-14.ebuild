EAPI=8

DESCRIPTION="Hardened allocator designed for modern systems."
HOMEPAGE="https://github.com/GrapheneOS/hardened_malloc"
SRC_URI="https://github.com/GrapheneOS/hardened_malloc/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"

DEPEND=""

src_install() {
	newlib.so out/libhardened_malloc.so libhardened_malloc.so
}
