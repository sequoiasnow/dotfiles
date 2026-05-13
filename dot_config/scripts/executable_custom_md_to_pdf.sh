#!/usr/bin/env bash

set -e

input=$1
output=${2:-$(printf "$1" | cut -d '.' -f 1)}

echo "Converting $1 to PDF ($2) with custom configurations"

pansribe="${HOME:-'~'}/dev/external/panscribe"

tmp_file=$(printf "$1" | awk -F '/' '{print $NF}')

# Copy the files to where panscribe resides
mkdir -p $panscribe/tmp
cp $input $panscribe/tmp/$tmp_file

# show command
set -x

pandoc -f markdown -t pdf --defaults=defaults/chapbook-manuscript.yml tmp/$tmp_file -o tmp/$tmp_file.pdf

unset -x

cd -
cp tmp/$tmp_file.pdf $output

rm tmp/$tmp_file.pdf
rm tmp/$tmp_file

echo "Success!"

