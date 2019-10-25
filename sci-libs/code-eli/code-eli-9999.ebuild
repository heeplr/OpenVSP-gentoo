# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3

DESCRIPTION="C++ Curve & surface libraries that provide a variety of functionalities."
HOMEPAGE="https://github.com/ddmarshall/Code-Eli"
EGIT_REPO_URI="https://github.com/ramcdona/Code-Eli.git"
#EGIT_COMMIT="f9ff74f311"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS=""
IUSE="doc examples test"

DEPEND="dev-util/cmake
	doc? ( app-doc/doxygen )
	test? ( dev-util/cpptest )"
RDEPEND=""

DOCS="README.md"

src_compile() {
        emake

	if use examples ; then
		emake example
	fi

	if use doc ; then
		emake doc
	fi

	if use test ; then
		emake test
	fi
}

src_install() {
	doheader -r "${S}/include/eli"
	doheader -r "${BUILD_DIR}/include/eli"
}
