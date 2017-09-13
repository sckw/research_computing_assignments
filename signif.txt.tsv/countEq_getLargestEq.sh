echo Total number of earthquakes in "$1": $(cut -f 3 Year_Mag_Country.tsv | sort | uniq -c | grep -w -i "$1")
echo Largest earthquake magnitude in "$1": $(cut -f 2,3 Year_Mag_Country.tsv | grep -w -i "$1" | sort -n -r | head -n 1 | cut -f 1)
echo Year of largest earthquake in "$1": $(cut -f 1,2,3 Year_Mag_Country.tsv | grep -w -i "$1" | sort -n -r | head -n 1 | cut -f 1)
