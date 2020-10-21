#!/bin/bash

for i in "$HOME/.zkg/logs/*-build.log"; do
    echo "Build failed"
    echo "============"
    echo "${i}:"
    cat "$i"
end

for i in "$HOME/.zkg/testing/*/clones/*/zkg.test_command.{stderr,stdout}"; do
    echo "Test failed"
    echo "============"
    echo "${i}:"
    cat "$i"
end

exit 1
