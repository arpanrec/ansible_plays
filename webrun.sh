#!/usr/bin/env bash
set -e

__clone_directory="${HOME}/.tmp/ansible_plays"
__git_setup_repo='https://github.com/arpanrec/ansible_plays.git'

if ! hash git &>/dev/null; then
	echo "git not Installed"
	exit 1
fi

if ! hash pip3 &>/dev/null; then
	echo "python-pip or python3-pip not Installed"
	exit 1
fi

rm -rf "${__clone_directory}"
mkdir -p "$(dirname "${__clone_directory}")"

if [[ ! -d ${__clone_directory} ]]; then
	git clone --depth 1 --single-branch --branch "feature/inprogress" "${__git_setup_repo}" "${__clone_directory}"
	cd "${__clone_directory}"
else
	cd "${__clone_directory}"
fi

git reset --hard HEAD
git clean -f -d
git pull

ls -al

./prosessor.py "$@"
