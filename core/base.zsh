#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::pip::install {
    message_info "Installing pip"
    case "${OSTYPE}" in
        cygwin)
            if type -p easy_install >/dev/null; then
                easy_install https://pypi.python.org/packages/source/p/pip/pip-19.4.1.tar.gz
            fi
            ;;
        freebsd* | darwin* | linux*)
            easy_install pip
            ;;
    esac
    message_success "Installed pip"
}

if ! type -p pip > /dev/null; then
    core::pip::install
fi

function core::aws_cdk::install {
    message_info "Installing Dependences for ${AWS_PACKAGE_NAME}"
    yarn global add aws-cdk
    message_success "${AWS_PACKAGE_NAME} Dependences Installed"
}

if ! type -p cdk > /dev/null; then core::aws_cdk::install; fi

function core::aws_sam::install {
    message_info "Installing Dependences for ${AWS_PACKAGE_NAME}"
    case "${OSTYPE}" in
        darwin*)
            brew tap aws/tap
            brew install aws-sam-cli
            ;;
    esac
    message_success "${AWS_PACKAGE_NAME} Dependences Installed"
}

if ! type -p sam >/dev/null; then core::aws_sam::install; fi

function core::aws::install {
    message_info "Installing ${AWS_PACKAGE_NAME}"
    python -m pip install --user -U awscli s3cmd
    message_success "${AWS_PACKAGE_NAME} Installed"
}

if ! type -p aws > /dev/null; then core::aws::install; fi
