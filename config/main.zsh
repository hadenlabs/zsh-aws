#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function aws::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_AWS_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_AWS_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_AWS_PATH}"/config/linux.zsh
      ;;
    esac
}

aws::config::main::factory