#Type country name in quotation brackets
cut -f 3 Year_Mag_Country.tsv | sort | uniq -c | grep -w -i "$1" | grep -v -i "territory"
