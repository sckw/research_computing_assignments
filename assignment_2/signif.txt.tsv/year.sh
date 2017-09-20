#Outputs Year, Magnitude and Country of all earthquakes in YEAR.

for YEAR in $(cut -f 1 Year_Mag_Country.tsv | uniq -c | sort -nr | head | cut -b 9-12)
do
	grep -w "$YEAR" Year_Mag_Country.tsv > $YEAR-earthquakes.txt
	echo $YEAR-earthquakes.txt
done
