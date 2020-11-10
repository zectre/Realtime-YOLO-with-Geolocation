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
while sleep 5; do
	echo 'no' >> log.txt
done&
while true; do
	if A; then
		echo 'Kibor' >> ./hasil/kibor.txt &
		sleep 5
	fi
	if B; then
		echo 'Monitorz' >> ./hasil/mon.txt &
		sleep 5
	fi
	if C; then
		echo 'Cupz' >> ./hasil/cup.txt & 
		sleep 5
	fi
done
