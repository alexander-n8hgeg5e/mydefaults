if not test -e /usr/lib64/libswmhack.so
    if set -q LD_PRELOAD
        eval set LD_PRELOAD (string replace --all --regex \''[a-z/]+libswmhack[.]so[.0-9]*'\' \'\' \""$LD_PRELOAD"\")
    end
end

# vim: set syntax=sh :
