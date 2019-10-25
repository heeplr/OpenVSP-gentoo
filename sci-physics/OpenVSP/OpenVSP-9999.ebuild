# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{4,5,6} )

inherit cmake-utils git-r3 python-single-r1

DESCRIPTION="NASA open source parametric geometry"
HOMEPAGE="https://getmonero.org/"

EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
KEYWORDS=""

LICENSE="NOSA"
SLOT="0"
DOCS=(
	"README.md"
	"LICENSE"
)
PATCHES=(
	"${FILESDIR}/install_paths.patch"
)
IUSE="doc python test X"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="python? ( dev-lang/swig )
	dev-util/cmake
	dev-util/cpptest
	doc? ( app-doc/doxygen )
	sci-libs/code-eli
	python? ( ${PYTHON_DEPS} )
	X? ( sci-libs/libIGES )
	test? ( dev-util/cpptest ${RDEPEND} )"

RDEPEND=">=dev-cpp/eigen-3.0.0
	dev-libs/angelscript
	dev-libs/libxml2
	X? (
		media-libs/freetype
		media-libs/fontconfig
		media-libs/glew
		media-libs/glm
		virtual/jpeg
		x11-libs/fltk
	)
	sci-libs/cminpack
	python? ( ${PYTHON_DEPS} )"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DLIBIGES_LIBRARIES="/usr/$(get_libdir)/libiges.so"
		-DBUILD_TESTING=$(use test && echo "ON" || echo "OFF")
	)

	use X || mycmakeargs+="-DVSP_NO_GRAPHICS=ON"

	cmake-utils_src_configure
}
