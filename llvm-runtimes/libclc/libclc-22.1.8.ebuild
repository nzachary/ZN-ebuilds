# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Modified libclc ebuild to use the Mesa patched libclc

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
inherit cmake python-any-r1

DESCRIPTION="OpenCL C library with Mesa patches"
HOMEPAGE="https://gitlab.freedesktop.org/karolherbst/mesa-libclc"
SRC_URI="https://gitlab.freedesktop.org/karolherbst/mesa-libclc/-/archive/22.1.8.3/mesa-libclc-22.1.8.3.tar.bz2 -> ${P}.tar.bz2"

LICENSE="Apache-2.0-with-LLVM-exceptions || ( MIT BSD )"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~loong ~riscv ~x86"
IUSE="+spirv"

BDEPEND="
    ${PYTHON_DEPS}
    virtual/pkgconfig
    llvm-core/clang:22
    spirv? (
        >=dev-util/spirv-llvm-translator-22:*
    )
"

src_unpack() {
	unpack ${P}.tar.bz2
	mv mesa-libclc-22.1.8.3 ${P}
}

src_configure() {
    local libclc_targets=(
    )

    use spirv && libclc_targets+=(
        "spirv-mesa3d-"
        "spirv64-mesa3d-"
    )

    libclc_targets=${libclc_targets[*]}
    local mycmakeargs=(
        -DLLVM_ROOT="${ESYSROOT}/usr/lib/llvm/22"
        -DLIBCLC_TARGETS_TO_BUILD="${libclc_targets// /;}"
    )
    cmake_src_configure
}
