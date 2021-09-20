#!/usr/bin/env bash

ghc -o typing-test main.hs || exit 1

./typing-test