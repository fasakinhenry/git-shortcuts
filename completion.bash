_git_shortcuts_complete() {
    local cmds="
a gc gs gl p pl
gnew gclean gundo gfix
gversion gupdate githelp
"
    COMPREPLY=($(compgen -W "$cmds" -- "${COMP_WORDS[1]}"))
}

complete -F _git_shortcuts_complete a gc gs gl p pl gnew gclean gundo gfix gversion gupdate githelp
