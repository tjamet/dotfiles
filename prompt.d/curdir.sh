function __curdir_ps1(){
    reset='\e[00m'
    blue='\e[01;34m'
    lightblue='\e[01;36m'
    green='\e[01;32m'
    red='\e[01;31m'
    printf ${blue}$(dirs +0 |awk -F/ '{for (i=1 ; i<NF ; i++) printf substr ($i, 0, i)"/"; printf $NF}')${reset}
}