#!/bin/bash
#enter $1 as sensors, $2 as readings
#for using command print ./doit.awk sensors readings
#sensors and readings must be in the same folder, or just use full path for them
#create variables with number of repetitions of single parameter
for(( i=1; i<6; i++ ))
do
	count[i]=$( awk -F"/" '{if( $2 == "'$i'" ) a++ } END{print a}' $2 )
done
#doing some text manipulations
awk '
BEGIN{
FS="/"
}
{ print $2" "$3 } ' $2 | sort | \
awk '
{
for (i=1; i<6; i++){
if ( $1 == i ){
	vic[i]=vic[i]+$2;
	g[i]++;
	ceo[i] = vic[i] / g[i];
}
} 
}
NR=="'${count[1]}'"+1 {print $1" "ceo[1]}
NR=="'${count[2]}'"+"'${count[1]}'"+1 {print $1" "ceo[2]}
NR=="'${count[3]}'"+"'${count[2]}'"+"'${count[1]}'"+1 {print $1" "ceo[3]}
NR=="'${count[4]}'"+"'${count[3]}'"+"'${count[2]}'"+"'${count[1]}'"+1 {print $1" "ceo[4]}
NR=="'${count[5]}'"+"'${count[4]}'"+"'${count[3]}'"+"'${count[2]}'"+"'${count[1]}'"+1 {print $1" "ceo[5]}
' >> 1.tmp
join $1 1.tmp | awk '{printf "%s\t%.0f\n",$2,$3}' | sort -t'	' -k2
rm 1.tmp
