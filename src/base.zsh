#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function pip::install {
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
    pip::install
fi