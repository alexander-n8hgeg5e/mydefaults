
if ! [[ -e /usr/lib64/libswmhack.so ]] ;then
    if [[ -n "${LD_PRELOAD}" ]];then
 		if [[ "${LD_PRELOAD}" =~  ([^ ]+libswmhack[^ ]+) ]] ;then
            LD_PRELOAD=${LD_PRELOAD/${BASH_REMATCH[1]}/}
        fi
    fi
fi
