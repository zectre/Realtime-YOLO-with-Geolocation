#!/bin/bash
A()
{
	tail -1 log.txt| grep --line-buffered -q 'D00'
}
B()
{
	tail -1 log.txt| grep --line-buffered -q 'D01'
}
C()
{
	tail -1 log.txt| grep --line-buffered -q 'D10'
}
D()
{
	tail -1 log.txt| grep --line-buffered -q 'D11'
}
E()
{
	tail -1 log.txt| grep --line-buffered -q 'D20'
}
F()
{
	tail -1 log.txt| grep --line-buffered -q 'D40'
}
G()
{
	tail -1 log.txt| grep --line-buffered -q 'D43'
}
H()
{
	tail -1 log.txt| grep --line-buffered -q 'D44'
}
while sleep 5; do
	echo 'no' >> log.txt
done&
while true; do
	LON=$(gpspipe -w 2>&1 | grep --line-buffered lon -m 1 | jq -r '.lon')
	LAT=$(gpspipe -w 2>&1 | grep --line-buffered lat -m 1 | jq -r '.lat')
	if A; then
		echo 'D00' $LON $LAT >> ./hasil/D00.txt &
		sleep 0.5
	fi
	if B; then
		echo 'D01' $LON $LAT >> ./hasil/D01.txt &
		sleep 0.5
	fi
	if C; then
		echo 'D10' $LON $LAT >> ./hasil/D10.txt &
		sleep 0.5
	fi
	if D; then
		echo 'D11' $LON $LAT >> ./hasil/D11.txt &
		sleep 0.5
	fi
	if E; then
		echo 'D20' $LON $LAT >> ./hasil/D20.txt &
		sleep 0.5
	fi
	if F; then
		echo 'D40' $LON $LAT >> ./hasil/D40.txt &
		sleep 0.5
	fi
	if G; then
		echo 'D43' $LON $LAT >> ./hasil/D43.txt &
		sleep 0.5
	fi
	if H; then
		echo 'D44' $LON $LAT >> ./hasil/D44.txt &
		sleep 0.5
	fi
done
