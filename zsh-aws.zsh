#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install aws for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
#
ZSH_AWS_SRC_PATH="$(dirname "${0}")"

export AWS_PACKAGE_NAME=aws

# shellcheck source=/dev/null
source "${ZSH_AWS_SRC_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_AWS_SRC_PATH}"/core/main.zsh

