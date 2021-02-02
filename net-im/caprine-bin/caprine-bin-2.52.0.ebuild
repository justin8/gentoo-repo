# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN/-bin/}"
MY_BIN="caprine"
MY_PATH="Caprine"

inherit desktop unpacker xdg

DESCRIPTION="Elegant Facebook Messenger desktop app"
HOMEPAGE="https://sindresorhus.com/caprine"
SRC_URI="https://github.com/sindresorhus/caprine/releases/download/v${PV}/${MY_PN}_${PV}_amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_prepare() {
	default
	unpack_deb "${A}"
}

src_install() {
	insinto /opt/
	doins -r opt/${MY_PATH}

	insinto /usr/share/icons
	doins -r usr/share/icons/.

	domenu usr/share/applications/caprine.desktop
	fperms +x /opt/${MY_PATH}/${MY_BIN}
}
