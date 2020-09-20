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
    brew cask install aws-vault
}

if ! type -p aws-vault > /dev/null; then
    core::aws_vault::install
fi

function core::aws_sam::install {
    message_info "Installing Dependences for ${AWS_PACKAGE_NAME}"
    brew tap aws/tap
    brew install aws-sam-cli
    message_success "${AWS_PACKAGE_NAME} Dependences Installed"
}

if ! type -p sam >/dev/null; then core::aws_sam::install; fi