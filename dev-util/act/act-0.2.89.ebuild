EAPI=8

inherit go-module

DESCRIPTION="Run github workflows locally"
HOMEPAGE="https://nektosact.com"
SRC_URI="https://github.com/nektos/act/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://github.com/nzachary/ebuild-files/raw/refs/heads/main/act-0.2.89-vendor.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"

src_compile() {
    emake VERSION="${PV}" build
}

src_install() {
    dobin dist/local/act
}
