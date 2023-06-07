# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_11 )
inherit python-single-r1
inherit git-r3

DESCRIPTION="Tensor Network Python"
HOMEPAGE="https://tenpy.github.io/"
EGIT_REPO_URI="https://github.com/tenpy/tenpy.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=">=dev-python/numpy-1.13
		 >=dev-python/scipy-0.18
		 >=dev-python/cython-0.29
		 >=dev-python/setuptools-30.3.0
		 dev-python/pandas
		 dev-python/h5py
		 dev-python/matplotlib
		 dev-pyton/pyyaml"

DEPEND="${RDEPEND}"

src_configure() {
	bash ./compile.sh
}

src_install() {
	python_domodule tenpy
	python_domodule build
	#python_doheader ${S}/tenpy/_version.py
}
