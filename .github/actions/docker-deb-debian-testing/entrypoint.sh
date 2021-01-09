#!/bin/sh
set -e
# Set the install command to be used by mk-build-deps (use -y for non-interactive)
install_tool="apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends -y"

# Install build dependencies first
mk-build-deps -ir --tool="${install_tool}" $1/debian/control

# Download the upstream source
uscan --download-current-version --check-dirname-level 0 $1
tar xvf `find -maxdepth 1 -mindepth 1 ! -type d | grep '\.orig\.tar'`
cd `find -maxdepth 1 -mindepth 1 -type d | grep '\-[0-9\.]\+$'`
cp -fR ../$1/debian .
shift

# Build the package
dpkg-buildpackage $@

# Output the filename
#cd ..
#filename=`ls *.deb | grep -v -- -dbgsym`
#dbgsym=`ls *.deb | grep -- -dbgsym`
#
#echo ::set-output name=filename::$filename
#echo ::set-output name=filename-dbgsym::$dbgsym

