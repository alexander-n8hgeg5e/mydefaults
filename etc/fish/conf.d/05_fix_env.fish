if not test -e /usr/lib64/libswmhack.so
    if set -q LD_PRELOAD
        eval set LD_PRELOAD (string replace --all --regex \''[a-z/]+libswmhack[.]so[.0-9]*'\' \'\' \""$LD_PRELOAD"\")
    end
end
for var in (set -xng)
    if not contains "$var" PWD SHLVL
        set -x $var (string replace -r -- '[$]{([^}]+)}' '\1' "$$var" )
    end
end

# vim: set syntax=sh :
