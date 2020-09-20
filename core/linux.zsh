#!/usr/bin/env ksh
# -*- coding: utf-8 -*-
function core::pip::install {
    message_info "Installing pip"
    easy_install pip
    message_success "Installed pip"
}

if ! type -p pip > /dev/null; then
    core::pip::install
fi

function core::aws_vault::install {
    brew install aws-vault
}

if ! type -p aws-vault > /dev/null; then
    core::aws_vault::install
fi

function core::aws_sam::install {
    message_warning "${AWS_MESSAGE_NOT_FOUND}"
}

if ! type -p sam >/dev/null; then core::aws_sam::install; fi