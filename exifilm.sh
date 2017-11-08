#!/bin/bash

mSet=false
cSet=false
nSet=false
lSet=false
bSet=false
fSet=false
iSet=false
dSet=false
executeString="exiftool -overwrite_original "

while getopts ":m:c:n:l:b:f:i:d:h" opt; do
	case $opt in
		\?)
			echo -e "Invalid option: -$OPTARG ; use -h for help" >&2
			exit 1
			;;
		:)
			echo -e "Option -$OPTARG requires an argument ; use -h for help" >&2
			exit 1
			;;
		h)
			echo -e "EXIFilm.sh version 0.1\n(C) 2017 Lars Meyer\n"
			echo -e "Options:"
			echo -e "-m Camera manufacturer"
			echo -e "-c Camera model"
			echo -e "-n Lens manufacturer"
			echo -e "-l Lens model"
			echo -e "-b Focal length"
			echo -e "-f Film"
			echo -e "-i ISO"
			echo -e "-d Date (YYYY:MM:DD HH:MM:SS)"
			echo -e "-h This help\n"
			echo -e "This script uses Exiftool (C) 2003-2017 Phil Harvey"
			exit 0
			;;
		m)
			if [[ !$mSet ]]; then
				mSet=true
				executeString+="-Make=\"$OPTARG\" "
			fi
			;;
		c)
			if [[ !$cSet ]]; then
				cSet=true
				executeString+="-Model=\"$OPTARG\" "
			fi
			;;
		n)
			if [[ !$nSet ]]; then
				nSet=true
				executeString+="-LensMake=\"$OPTARG\" "
			fi
			;;
		l)
			if [[ !$lSet ]]; then
				lSet=true
				executeString+="-LensModel=\"$OPTARG\" "
			fi
			;;
		b)
			if [[ !$bSet ]]; then
				bSet=true
				executeString+="-FocalLength=$OPTARG "
			fi
			;;
		f)
			if [[ !$fSet ]]; then
				fSet=true
				executeString+="-UserComment=\"$OPTARG\" "
			fi
			;;
		i)
			if [[ !$iSet ]]; then
				iSet=true
				executeString+="-ISO=$OPTARG "
			fi
			;;
		d)
			if [[ !$dSet ]]; then
				dSet=true
				executeString+="-AllDates=\"$OPTARG\" "
			fi
			;;
	esac
done

executeString+="."
eval $executeString