#!/usr/bin/env bash

source bashistrano_conf.sh

# TODO just search for shell scripts in current dir
user_commands=$(cat "test.sh")
command=${1:-main} # Default to a command called "hello"

for server in $servers
do
    ssh -T ${user}@${server} <<-EOF
        PATH=/usr/bin:/usr/local/bin:/bin
        # Make some vars available to user commands
        cmd_host=${HOSTNAME}
        cmd_user=${USER}

        # Make some helper functions available to user commands
        prnt () {
            local cyan=$(tput setaf 6)
            local clear=$(tput clear)
            echo "${cyan}[${user}@${server}]${clear} \$1"
        }

        # Default command, can be redefined by user
        main () {
            prnt "Hello, world"
        }

        prnt "Connected"

        $user_commands

        prnt "Running '$command' on $server"
        $command
EOF
done
