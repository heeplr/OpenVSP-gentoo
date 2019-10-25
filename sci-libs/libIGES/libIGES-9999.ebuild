# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3

DESCRIPTION="Implementation of the IGESv5.3 specification"
HOMEPAGE="http://cbernardo.github.io/libIGES"
EGIT_REPO_URI="https://github.com/cbernardo/libIGES"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-util/cmake-3.0.0"
RDEPEND=""

DOCS="BUGS LICENSE NOTES.cutouts README.md README.testing.md TODO"

src_install() {
	cmake-utils_src_install
	# do not violate multilib strict
	mv "${ED}/usr/lib" "${ED}/usr/$(get_libdir)" || die "mv failed"
}
