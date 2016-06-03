#!/bin/bash

# <bitbar.title>Show ANSI colors</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Kent Karlsson</bitbar.author>
# <bitbar.author.github>vogonistic</bitbar.author.github>
# <bitbar.desc>Example of how to use ANSI color codes</bitbar.desc>
# <bitbar.image>http://i.imgur.com/kGVgf6y.png</bitbar.image>
# <bitbar.abouturl>https://github.com/matryer/bitbar-plugins/blob/master/Tutorial/ansi.sh</bitbar.abouturl>

echo -e "\033[34mA\033[32mN\033[31mS\033[33mI\033[0m | ansi=true"
echo "---"

T='gYw'   # The test text
echo -e "                 40m     41m     42m     43m\
     44m     45m     46m     47m | ansi=true font=courier trim=false";

for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
    do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
  done
  echo " | ansi=true font=courier trim=false";
done
echo "---"
for clbg in {40..47} {100..107} 49 ; do
	#Foreground
	for clfg in {30..37} {90..97} 39 ; do
		#Formatting
		for attr in 0 1 2 4 5 7 ; do
			#Print the result
			echo -en "\033[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \033[0m"
		done
		echo " | ansi=true font=courier trim=false" #Newline
	done
done
echo "---"
for fgbg in 38 48 ; do #Foreground/Background
	for color in {0..256} ; do #Colors
		#Display the color
		echo -en "\033[${fgbg};5;${color}m ${color}\t\033[0m"
		#Display 10 colors per lines
		if [ $((($color + 1) % 10)) == 0 ] ; then
			echo " | ansi=true font=courier trim=false" #New line
		fi
	done
	echo " | ansi=true font=courier trim=false" #New line
done
echo "---"
echo "Open color codes in browser… | href=http://misc.flogisoft.com/bash/tip_colors_and_formatting#colors"
echo "Refresh | refresh=true"
