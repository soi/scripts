#! /bin/bash

old_dir=$(pwd)
main_dir='/work/ka1176/felix/git'

dirs=('2020-03-gfz-remote-sensing' '2020-06-kit-atmospheric-chemistry' 'aimtorch')
for dir in "${dirs[@]}"
do
    echo "pulling $dir"
    cd $main_dir/$dir
    git pull --all
    echo ""
done

cd $old_dir
