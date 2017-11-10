#!/bin/bash
command -v vagrant &>/dev/null && {
    vagrant box add ubuntu/artful64
}

command -v docker &>/dev/null && {
    docker pull bunn/devbox:latest 
}
