function __userhost_ps1(){
    reset='\e[00m'
    blue='\e[01;34m'
    lightblue='\e[01;36m'
    green='\e[01;32m'
    red='\e[01;31m'
    printf ${green}$(id -un)@$(hostname -s)${reset}': '
}