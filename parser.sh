popen=0
ulopen=0
liopen=0
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
		"p")
			if [ -z "$(echo $line | awk {'$1=""; print'})" ]; then
				echo "<p>"
			else
			   	echo "<p>$(echo $line | awk {'$1=""; print'})<br>" 
			fi
			popen=1;
			;;
		"ul")	
			echo "<ul>$(echo $line | awk {'$1=""; print'})" 
			ulopen=1;
			;;
		"li")
			if [ $liopen == 1 ] ; then
				echo "</li>"
			fi
			echo "<li>$(echo $line | awk {'$1=""; print'})" 
			liopen=1;
			;;
		"") 
			if [ $liopen == 1 ]; then
				echo "</li>";
				liopen=0;
			fi
			if [ $ulopen == 1 ]; then
				echo "</ul>";
				ulopen=0;
			fi
			if [ $popen == 1 ]; then
				echo "</p>";
				popen=0;
			fi
			;;
		*) 
			if [ $popen == 1 ]; then
				echo "$line<br>"
			else
				echo "$line"
			fi
	esac
done

if [ $liopen == 1 ]; then
	echo "</li>";
fi
if [ $ulopen == 1 ]; then
	echo "</ul>";
fi
if [ $popen == 1 ]; then
	echo "</p>";
fi
