function __docker_host_ps1(){
    reset='\e[00m'
    blue='\e[01;34m'
    lightblue='\e[01;36m'
    green='\e[01;32m'
    red='\e[01;31m'
    if ! [ -z ${DOCKER_HOST} ]; then
        if ! [ ${DOCKER_HOST} = *127.* ]; then
            printf " (${blue}Docker:${reset} ${lightblue}${DOCKER_HOST}${reset})"
        fi
    fi
}
