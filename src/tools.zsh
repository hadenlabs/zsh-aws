#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function aws_vault::install::osx {
    brew cask install aws-vault
}

function aws_vault::install::linux {
    brew install aws-vault
}

function aws_vault::install {
    message_info "Installing aws_vault"
    case "${OSTYPE}" in
        darwin)
            aws_vault::install::osx
            ;;
        linux*)
            aws_vault::install::linux
            ;;
    esac
    message_success "Installed aws_vault"
}

if ! type -p aws-vault > /dev/null; then
    aws_vault::install
fi