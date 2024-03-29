#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function aws::pkg::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_AWS_PATH}"/pkg/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_AWS_PATH}"/pkg/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_AWS_PATH}"/pkg/linux.zsh
      ;;
    esac

}

aws::pkg::main::factory
