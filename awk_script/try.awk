#!/bin/bash
#enter $1 as sensors, $2 as readings
#for using command print ./try.awk sensors readings
#sensors and readings must be in the same folder, or just use full path for them
#doing some text manipulations
awk -F"/" '
{ print $2" "$3 } ' $2 | \
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
END{
for (i=1; i<6; i++ ){
	printf "%d %.0f\n",i,ceo[i]
}
}
' >> 1.tmp
join $1 1.tmp | awk '{print $2"\t"$3}' | sort -t'	' -k2
rm 1.tmp
