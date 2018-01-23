poen=0
ulopen=0
param=""
cat $1 | while read line
do
	param=$(echo $line | awk {'print $1'})
	case $param in
		"h1") echo "<h1>$(echo $line | awk {'$1=""; print'})</h1>" 
			;;
		"h2") echo "<h2>$(echo $line | awk {'$1=""; print'})</h2>" 
			;;
		"h3") echo "<h3>$(echo $line | awk {'$1=""; print'})</h3>" 
			;;
		*) echo $line
	esac

#	echo "param $param"
#	if [ -z "$line" ]; then
#		echo "empty line"
#	else
#		echo $line
#	fi
done
