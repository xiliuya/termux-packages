termux_pkg_error() {
	local pkg="${1:-unknown}"
	local err_strings
	IFS= read -r -d '' error_msg <<-EOF
		Package '${pkg}' is not installed.
		You can install it with:
		  pkg install ${pkg}
		  pacman -S ${pkg}
		or build it from source with:
		  ./build-package.sh ${pkg}
	EOF

	termux_error_exit "${error_msg}"
}
