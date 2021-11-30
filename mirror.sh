#!/bin/bash

# -------------------------------------------------------------------------------------------------------------------- #
# INITIALIZATION.
# -------------------------------------------------------------------------------------------------------------------- #

init() {
  # Vars.
  SOURCE_REPO="${1}"
  SOURCE_USER="${2}"
  SOURCE_TOKEN="${3}"
  TARGET_REPO="${4}"
  TARGET_USER="${5}"
  TARGET_TOKEN="${6}"

  # Apps.
  git="$( command -v git )"

  # Run.
  mirror
}

init "$@"

# -------------------------------------------------------------------------------------------------------------------- #
# GIT: MIRROR.
# -------------------------------------------------------------------------------------------------------------------- #

mirror() {
  SOURCE="https://${SOURCE_USER}:${SOURCE_TOKEN}@${SOURCE_REPO#https://}"
  TARGET="https://${TARGET_USER}:${TARGET_TOKEN}@${TARGET_REPO#https://}"

  ${git} clone --mirror "${SOURCE}" '/root/git/source' \
    && _pushd '/root/git/source' || exit 1
  ${git} remote add 'target' "${TARGET}"
  ${git} push -f --mirror 'target'
  _popd || exit 1
}

# -------------------------------------------------------------------------------------------------------------------- #
# ------------------------------------------------< COMMON FUNCTIONS >------------------------------------------------ #
# -------------------------------------------------------------------------------------------------------------------- #

# Pushd.
_pushd() {
  command pushd "$@" > /dev/null || exit 1
}

# Popd.
_popd() {
  command popd > /dev/null || exit 1
}

exit 0
