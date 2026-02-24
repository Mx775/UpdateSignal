#!/bin/bash
# shellcheck disable=2034
# This is meant to be `source`d

# ### Lists
declare -a PkgsManuallyUpdated PkgsServiceUpdated

PkgsManuallyUpdated=(
    android-build-tools
    firefox-browser
    rar

    Factory/nim
)

PkgsServiceUpdated=(
    android-apktool
    codium
    ffsend
    # floorp-browser
    hblock
    obsidian
    telegram
    ventoy
    
    Factory/apk-editor-studio
    Factory/croc
    Factory/hydroxide
    Factory/pdfcpu
    Factory/shc

    Plasma/better-blur-dx
    Plasma/darkly-qt
)

# ### This section contains information on how to get latest version
declare -A PkgUpstreamURLs PkgProjectNameOverrides

PkgProjectNameOverrides=(
    [android-apktool]=apktool
    [codium]=vscodium
    [firefox-browser]=firefox
    [telegram]=telegram-desktop

    [pdfcpu]=golang-github-pdfcpu

    [darkly-qt]=Darkly
)

PkgUpstreamURLs=(
    [android-build-tools]="https://aur.archlinux.org/android-sdk-build-tools.git"
    [rar]="https://aur.archlinux.org/rar.git"

    [android-apktool]="https://github.com/iBotPeaches/Apktool" # **
    [floorp-browser]="https://github.com/Floorp-Projects/Floorp"
    [hblock]="https://github.com/hectorm/hblock"
    [obsidian]="https://github.com/obsidianmd/obsidian-releases" # **
    [telegram]="https://github.com/telegramdesktop/tdesktop" # **
    [ventoy]="https://github.com/ventoy/Ventoy" # **
    
    [apk-editor-studio]="https://github.com/kefir500/apk-editor-studio"
    [hydroxide]="https://github.com/emersion/hydroxide"
    [nim]="https://github.com/nim-lang/Nim" # **
    [shc]="https://github.com/neurobin/shc" # **

    [better-blur-dx]="https://github.com/xarblu/kwin-effects-better-blur-dx"
    [darkly-qt]="https://github.com/Bali10050/Darkly" # **
    
    # This fails for some reaseon
    # [sonic-silver-theme]="https://github.com/Sonic-DE/silver-theme"
)
