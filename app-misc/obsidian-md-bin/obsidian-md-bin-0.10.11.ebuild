# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN/-bin/}"
APP_IMAGE="${MY_PN}.AppImage"

inherit desktop unpacker xdg

DESCRIPTION="Elegant Facebook Messenger desktop app"
HOMEPAGE="https://obsidian.md"
SRC_URI="https://github.com/obsidianmd/obsidian-releases/releases/download/v${PV}/Obsidian-${PV}.AppImage -> ${APP_IMAGE}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-fs/fuse"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/${A}" "${WORKDIR}" || die "cp failed"
}

src_prepare() {
	default
	chmod +x ${APP_IMAGE}
	./${APP_IMAGE} --appimage-extract
}

src_install() {
	newbin ${APP_IMAGE} obsidian

	insinto /usr/share/icons
	doins -r squashfs-root/usr/share/icons/.

	domenu "${FILESDIR}/obsidian.desktop"
}
