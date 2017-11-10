#!/bin/bash
tmpdir=$(mktemp -d)

# ---- fonts ----
curl https://github.com/powerline/fonts/raw/master/Hack/Hack-Regular.ttf -o "${tmpdir}/hack-regular.ttf"
curl https://github.com/powerline/fonts/raw/master/Hack/Hack-Bold.ttf -o "${tmpdir}/hack-bold.ttf"
curl https://github.com/powerline/fonts/raw/master/Hack/Hack-Italic.ttf -o "${tmpdir}/hack-italic.ttf"
curl https://github.com/powerline/fonts/raw/master/Hack/Hack-BoldItalic.ttf -o "${tmpdir}/hack-bolditalic.ttf"

# ---- colors ----
curl https://raw.githubusercontent.com/chriskempson/base16-iterm2/master/base16-eighties.dark.itermcolors -o "${tmpdir}/base16-eighties-dark.itermcolors"

open "${tmpdir}"
