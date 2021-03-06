#!/bin/fish

function x
  exit
end

function env_set_from_config_file -a name
    if not set -q $name # do nothing if no var exists
         set fn "$EPREFIX"/etc/"$name"
         if test -e $fn  # do nothing if no file
            set val (cat $fn)
            if test -n "$fn"   # do nothing if empty string
                #sed_debug_flag_replace_line:echo set -gx "$name" "$val"
                set -gx "$name" "$val"
            end
        end
    end
end

function get_var_value_from_config_file -a name
    set fn "$EPREFIX"/etc/"$name"
    test -e "$fn"
    and cat "$fn"
end

function var_set_if_not_set -a scope_opts -a name -a value 
    set -q $name
    if test $status -ne 0
        set "$scope_opts" "$name" "$value"
    end
end

function var_gx_set_from_config_file -a name
    var_set_if_not_set -gx "$name" (get_var_value_from_config_file "$name")
end

function var_Ux_set_from_config_file -a name
    var_set_if_not_set -Ux "$name" (get_var_value_from_config_file "$name")
end

function env2uvar_from_env_var -a name
    set val $$name
    set -e -g $name
    set -Ux $name $val
end
