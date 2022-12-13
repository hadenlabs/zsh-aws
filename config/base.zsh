#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

export AWS_MESSAGE_GO_NOT_FOUND="Please install go or use antibody bundle hadenlabs/zsh-goenv"
export AWS_MESSAGE_NOT_FOUND="this not found installed"

export AWS_GO_PACKAGES=(
    github.com/99designs/aws-vault@latest
    github.com/minamijoyo/myaws@latest
    github.com/wallix/awless@latest
)
