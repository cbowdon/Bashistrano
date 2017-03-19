main () {
    echo "Hello from $USER (PATH=${PATH})"
}

something () {
    prnt "Here, I would totally do something for ${cmd_user}@${cmd_host}."
}
