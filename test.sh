main () {
    message "Hello from $USER (PATH=${PATH})"
}

something () {
    message "Here, I would totally do something for ${cmd_user}@${cmd_host}."
}
