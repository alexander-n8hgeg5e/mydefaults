#!/bin/fish

#function patmrl_is_ssh_alive
#    set -l local_socket $PULSEAUDIO_REMOTE_SOCKET_PREFIX"@tmrl"
#    set -l local_ssh_control_socket "/tmp/ssh_control_sock_"$USER"@"(hostname)"_made_tunnel_for_pulseaudio_to_""$USER""@patmrl"
#    test \( -e $local_socket \) -a \( -S $local_socket \); and test \( -e $local_ssh_control_socket \) -a \( -S $local_ssh_control_socket \)
#end
#
#function update_paenv
#    set -l local_socket $PULSEAUDIO_REMOTE_SOCKET_PREFIX"@tmrl"
#    if patmrl_is_ssh_alive
#        set -U  PULSE_SERVER unix:$local_socket
#    else
#        set -eU PULSE_SERVER
#    end 
#end
#
#function patmrl_connection_watcher
### watch for connection down and in case down update global fish env and exit
#   while true
#      if not patmrl_is_ssh_alive
#	     update_paenv
#	     exit
#      end
#      sleep 10
#   end
#end
#
#
#function patmrl
#
#    # setup vars
#    set local_socket $PULSEAUDIO_REMOTE_SOCKET_PREFIX"@tmrl"
#    set remoteaddr "127.0.0.1:4713"
#    set sshconfighost patmrl
#
#    # run tunnel creation cmd
#    sudo nice -n-20 ionice -c1 -n3 chrt -rr 40 sudo -u $USER ssh -L$local_socket":"$remoteaddr $sshconfighost
#
#    for i in (seq 100)
#        chmod  g=rw $local_socket;and chown :audio $local_socket;and break
#        sleep 0.5
#    end
#
#    update_paenv
#	# run checker in new independent context
#	rind fish -c patmrl_connection_watcher
#end
