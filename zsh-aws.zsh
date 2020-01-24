#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install aws for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

export AWS_PACKAGE_NAME=aws

AWS_PLUGIN_DIR=$(dirname "${0}")
AWS_SRC_DIR="${AWS_PLUGIN_DIR}"/src

# shellcheck source=/dev/null
source "${AWS_SRC_DIR}"/base.zsh

# shellcheck source=/dev/null
source "${AWS_SRC_DIR}"/aws.zsh

# shellcheck source=/dev/null
source "${AWS_SRC_DIR}"/tools.zsh
