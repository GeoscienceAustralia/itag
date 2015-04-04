#!/bin/bash
#
# Copyright 2013 Jérôme Gasperi
#
# iTag licenses this file to you under the Apache License,
# version 2.0 (the "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at:
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#

usage="## iTag deployment\n\n  Usage $0 -s <ITAG_HOME> -t <ITAG_TARGET>\n"
while getopts "s:t:h" options; do
    case $options in
        s ) SRCDIR=`echo $OPTARG`;;
        t ) TARGETDIR=`echo $OPTARG`;;
        h ) echo -e $usage;;
        \? ) echo -e $usage
            exit 1;;
        * ) echo -e $usage
            exit 1;;
    esac
done
if [ "$SRCDIR" = "" ]
then
    echo -e $usage
    exit 1
fi
if [ "$TARGETDIR" = "" ]
then
    echo -e $usage
    exit 1
fi

if [ -d "$TARGETDIR" ]; then
    if [ "$(ls $DIR)" ]; then
        echo "ERROR : $TARGETDIR is not empty. Cannot install"
        exit 1
    fi
fi

mkdir $TARGETDIR
echo ' ==> Copy files to $TARGETDIR directory'
cp -Rf $SRCDIR/index.php $SRCDIR/include $TARGETDIR
echo ' ==> Successfully install iTag to $TARGETDIR directory'
echo ' ==> Now, do not forget to check $TARGETDIR/include/config.php configuration !'
