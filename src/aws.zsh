#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function aws::get_aws_cdk {
    message_info "Installing Dependences for ${AWS_PACKAGE_NAME}"
    yarn global add aws-cdk
    message_success "${AWS_PACKAGE_NAME} Dependences Installed"
}

function aws::get_aws_sam {
    message_info "Installing Dependences for ${AWS_PACKAGE_NAME}"
    case "${OSTYPE}" in
        darwin*)
            brew tap aws/tap
            brew install aws-sam-cli
            ;;
    esac
    message_success "${AWS_PACKAGE_NAME} Dependences Installed"
}

function aws::install {
    message_info "Installing ${AWS_PACKAGE_NAME}"
    case "${OSTYPE}" in
        freebsd*) ;;
        darwin* | linux*)
            python -m pip install --user -U awscli s3cmd
            ;;
    esac
    message_success "${AWS_PACKAGE_NAME} Installed"
}

if ! type -p aws > /dev/null; then aws::install; fi
if ! type -p sam >/dev/null; then aws::get_aws_sam; fi
if ! type -p cdk > /dev/null; then aws::get_aws_cdk; fi