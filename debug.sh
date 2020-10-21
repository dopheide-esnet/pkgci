#!/bin/bash

PKG_NAME=$1

if compgen -G "$HOME"/.zkg/logs/*-build.log > /dev/null; then
    for i in "$HOME"/.zkg/logs/*-build.log; do
        echo "Build failed"
        echo "============"
        echo "${i}:"
        cat "$i"
    done
    echo "::set-output name=results::{\"$PKG_NAME\": {\"status\": \"failed\", \"stage\": \"build\"}}"
    exit 1
fi

if compgen -G "$HOME"/.zkg/testing/*/clones/*/zkg.test_command.{stderr,stdout} > /dev/null; then
    for i in "$HOME"/.zkg/testing/*/clones/*/zkg.test_command.{stderr,stdout}; do
        echo "Build failed"
        echo "============"
        echo "${i}:"
        cat "$i"
    done
    echo "::set-output name=results::{\"$PKG_NAME\": {\"status\": \"failed\", \"stage\": \"test\"}}"
    exit 1
fi
