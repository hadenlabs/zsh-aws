#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install aws for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

package_name=aws

plugin_dir=$(dirname "${0}":A)

# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/messages.zsh
# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/tools.zsh

function aws::get_pip {
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
}

function aws::get_aws_cdk {
    message_info "Installing Dependences for ${package_name}"
    yarn global add aws-cdk
    message_success "${package_name} Dependences Installed"
}

function aws::get_aws_sam {
    message_info "Installing Dependences for ${package_name}"
    case "${OSTYPE}" in
        darwin* | linux*)
            brew tap aws/tap
            brew install aws-sam-cli
            ;;
    esac
    message_success "${package_name} Dependences Installed"
}

function aws::install {
    message_info "Installing ${package_name}"
    if ! type -p pip >/dev/null; then aws::get_pip; fi
    case "${OSTYPE}" in
        freebsd*) ;;
        darwin* | linux*)
            pip install --user -U awscli s3cmd
            ;;
    esac
    message_success "${package_name} Installed"
}

if ! type -p aws > /dev/null; then aws::install; fi
if ! type -p sam >/dev/null; then aws::get_aws_sam; fi
if ! type -p cdk > /dev/null; then aws::get_aws_cdk; fi
