lynx/getdump () {
	local url="$1?" k v
	shift
	for k v
	do
		url="$url&$k=$v" 
	done
	lynx -dump "$url"
}

annuaire/getdump () {
	lynx/getdump "http://annuaire.unistra.fr/chercher" "$@"
}

annuaire/show () {
    annuaire/getdump "$@" |
        sed -r '
            0,/^\s*\*\s*$/  { d;t }
            /^I/,$          { d;t }
            /^\s*\*\s*$/    { d;t }
            s/^\s*(\[[0-9]+\])?//
        '
}

annuaire/show n chant p mar
