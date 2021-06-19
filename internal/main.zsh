#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function aws::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_AWS_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_AWS_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_AWS_PATH}"/internal/linux.zsh
      ;;
    esac
}

aws::internal::main::factory
