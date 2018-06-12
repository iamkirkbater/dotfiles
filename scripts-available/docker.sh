docker () {
    proxyargs=""
    if [ ${#@} -lt 1 ]
    then
        /usr/local/bin/docker
    else
        if [ $1 == "build" ]
        then
            proxyon
            proxyargs="--build-arg http_proxy=\"$http_proxy\" --build-arg https_proxy=$https_proxy --build-arg no_proxy=$no_proxy --build-arg HTTP_PROXY=$http_proxy --build-arg HTTPS_PROXY=$https_proxy --build-arg NO_PROXY=$no_proxy"
        fi
        /usr/local/bin/docker `echo ${@:1:-1} ${proxyargs} ${@: -1:1}`
    fi
}
