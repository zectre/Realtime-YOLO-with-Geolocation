#!/bin/bash
A()
{
	tail -1 log.txt| grep --line-buffered -q 'keyboard'
}
B()
{
	tail -1 log.txt| grep --line-buffered -q 'tvmonitor'
}
C()
{
	tail -1 log.txt| grep --line-buffered -q 'cup'
}
LON=$(gpspipe -w 2>&1 | grep --line-buffered lon -m 1 | jq -r '.lon')
LAT=$(gpspipe -w 2>&1 | grep --line-buffered lat -m 1 | jq -r '.lat')
while sleep 1; do
	if A; then
		echo 'Kibor' $LON $LAT >> ./hasil/kibor.tx
	fi
	if B; then
		echo 'Monitorz' $LON $LAT >> ./hasil/mon.tx
	fi
	if C; then
		echo 'Cupz' $LON $LAT >> ./hasil/cup.tx
	fi
done
