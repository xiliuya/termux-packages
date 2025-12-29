termux_pkg_check_version() {
	local pkg="${1:-unknown}"
	local pkg_version="${2:-unknown}"
	local pkg_marker="$TERMUX_BUILT_PACKAGES_DIRECTORY/${pkg}"

	[[ -f "${pkg}_marker" ]] && [[ "$(<"${pkg}_marker")" == "${pkg_version}" ]] && return 0

	case "$TERMUX_APP_PACKAGE_MANAGER" in
	"apt")
		dpkg-query -W -f '${db:Status-Status}\n' "${pkg}" 2>/dev/null | grep -q "installed" && return 0
		;;
	"pacman")
		pacman -Q "${pkg}" &>/dev/null && return 0
		;;
	*)
		command -v "${pkg}" &>/dev/null && return 0
		;;
	esac

	termux_pkg_error "${pkg}"
}
