#!/bin/bash

# Declaring default global variables
recursive=false
timeout=48
fileName=1;
#timeout=2


#.......................FUNCTIONS................................



# Just to remove old files
remove_file()
{
	rm $1
}


# Checking if the file is old enough
is_old()
{
	timeout=$((timeout*60))
   	$(test `find "$1" -mmin +${timeout}`)
#	echo $(test `find "$1" -mmin +${timeout}`)$?
}

# Checking if file is compressed
is_compressed()
{
	$(file "$1" | grep -q "compress\'d" || file "$1" | grep -q compressed )
	#echo $(( $(file "$1" | grep -q "compress\'d" || file "$1" | grep -q compressed )$? ))
}


# Moving files and Touching them when compressed
move_touch()
{
	parentDir=$(dirname $1)
	echo ${parentDir}
	if [[ $(basename $1) != fc-* ]]; then
		mv $1 $parentDir/fc-$(basename $1)
		touch $parentDir/fc-$(basename $1) 
	fi
}


zip_file()
{
	if [[ $(basename $1) != fc-* ]]; then
		parentDir=$(dirname $1)
		zip $parentDir/fc-$(basename $1).zip $1
		rm $1
	fi
}


#........................................................................................

#Get options


#.......................................................................................
# Main brain of this code
inner_files()
{
		echo "######################"
		echo ${1}
		# Looping through the path given
        for filePath in ${1}; do
				# For recursively traversing a directory
                if $recursive && [ -d "$filePath" ]; then
                        inner_files $filePath"/*"

				# Directory but no recursive traversal
				elif [[ -d "$filePath" ]]; then
					for files in $filePath*; do
						# File in directory but not compressed
						if [[ -f "$files" ]] && $(! is_compressed $files_ -eq 0); then
							echo "files in Directory without recursion And NOT compressed"
                          	zip_file $files

						# Compressed file in directory and old enough
                		elif [[ -f "$files" ]] && $(is_compressed $files -eq 0) && $(is_old $files -eq 0); then
                        	echo "files in Directory without recursion And Compressed"
							move_touch $files
						fi
					done

				# When a file is given and it's not compressed
				elif [[ -f "$filePath" ]] && $(! is_compressed $filePath -eq 0); then
                         echo "ZIPPING FILE NOW"
                         zip_file $filePath

				# When a compressed file is given and it is compressed
                elif [[ -f "$filePath" ]] && $(is_compressed $filePath -eq 0) && $(is_old $filePath -eq 0); then
                        move_touch $filePath
                fi
        done
}



while getopts ":t:r" flag
	do
	case "flag" in
    	r) recursive=true
            ;;
        t) timeout=${OPTARG}
            ;;
         \?) # Invalid option
          echo "Error: Invalid option"
          exit;;
     esac
 done
shift $((OPTIND -1))






inner_files $1
