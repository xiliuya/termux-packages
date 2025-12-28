TERMUX_PKG_HOMEPAGE=https://chawan.net/
TERMUX_PKG_DESCRIPTION="TUI web (and (S)FTP, Gopher, Gemini, ...) browser with CSS, inline image and JavaScript support."
TERMUX_PKG_LICENSE="Unlicense"
TERMUX_PKG_MAINTAINER="@xiliuya"
TERMUX_PKG_VERSION=0.3.2
TERMUX_PKG_SRCURL=https://git.sr.ht/~bptato/chawan/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=08f98ddf0040d0bf25dce62eac86d3ec5d2f11b2bc471213eb9c4c861a8d321a
TERMUX_PKG_DEPENDS="nim, openssh, libssh2, make, pkg-config, brotli"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true


termux_step_pre_configure() {
	termux_setup_nim
}
termux_step_make() {
	FLAGS=" --cc:clang --gcc.exe=${CC} --gcc.linkerexe=${CC} " make -j $TERMUX_PKG_MAKE_PROCESSES
}
termux_step_install_license() {
	mkdir -p "$TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME/"
	cp -af "$TERMUX_PKG_SRCDIR/UNLICENSE" "$TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME/copyright"
}
