#!/bin/sh
# Copyright 2023 the Cloverpage authors. All rights reserved. MIT license.
# TODO(everyone): Keep this script simple and easily auditable.

set -e

if ! command -v unzip >/dev/null; then
	echo "Error: unzip is required to install" 1>&2
	exit 1
fi

if [ "$OS" = "Windows_NT" ]; then
	target="x86_64-pc-windows-msvc"
else
	case $(uname -sm) in
	"Darwin x86_64") target="x86_64-apple-darwin" ;;
	"Darwin arm64") target="aarch64-apple-darwin" ;;
	"Linux aarch64")
		echo "Error: Official Cloverpage builds for Linux aarch64 are not available. (see: https://github.com/fonipts/cloverpage/issues/1846 )" 1>&2
		exit 1
		;;
	*) target="x86_64-unknown-linux-gnu" ;;
	esac
fi