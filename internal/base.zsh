#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function aws::internal::packages::install {
    if ! core::exists go; then
        message_warning "${AWS_MESSAGE_GO_NOT_FOUND}"
        return
    fi

    for package in "${AWS_GO_PACKAGES[@]}"; do
       GO111MODULE=on go install "${package}"
    done

    message_success "Installed required Go packages"
}
