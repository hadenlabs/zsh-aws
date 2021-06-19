#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function aws::post_install {
    message_info "Post Install ${AWS_PACKAGE_NAME}"
    message_success "Success Install ${AWS_PACKAGE_NAME}"
}

function aws::package::all::install {
    aws::internal::packages::install
}
