curl -L -o stations.txt http://ds.iris.edu/files/earthscope/usarray/_US-TA-StationList.txt
cut -f 5 stations.txt > lat.txt
cut -f 6 stations.txt > lon.txt
cut -f 8 stations.txt | cut -c 1,2,3,4 > years.txt
paste lon.txt lat.txt years.txt > stations.tsv

gmt makecpt -Crelief -T-5000/5000/1000 -Z > topo.cpt
gmt grdgradient us.nc -Ne0.8 -A100 -fg -Gus_i.nc
gmt grdimage us.nc -Ius_i.nc -JM6i -P -Ba -Ctopo.cpt -K > USArray.ps
gmt psscale -DjTC+w5i/0.25i+h+o0/-1i -Rus.nc -J -Ctopo.cpt -I0.4 -B1000y+lm -Al -O -K >> USArray.ps
gmt pscoast -Rus.nc -J -O -Wblack -Df -N1/1p -N2/0.5p -K >> USArray.ps
gmt makecpt -Crainbow -T2003/2017/1 > years.cpt
gmt psxy -R -J -O stations.tsv -Wfaint -h1 -Sc.1c -Cyears.cpt -K >> USArray.ps
gmt psscale -DjTC+w5i/0.25i+h+o0/2.8i -Rus.nc -J -Cyears.cpt -I0.4 -B2y+lyear -O >> USArray.ps

gmt psconvert USArray.ps -A0.2c -P -Tf