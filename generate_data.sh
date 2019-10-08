#!/bin/bash

kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic functions-test

cnt=1
str=""
while [ $cnt -le 100 ]
do
	str="${str}key2$cnt,value2$cnt"
	n=$(($cnt%10))
	if [ $n -eq 0 ]
	then
		m=$(($cnt%20))
		if [ $m -eq 0 ]
		then
			str="${str}\nkey_500,value_error500"
		else
			str="${str}\nkey_400,value_error400"
		fi
	fi
	if [ $cnt -ne 100 ]
	then
		str="${str}\n"
	fi
	((cnt++))
done

echo -e "${str}" | confluent local produce functions-test -- --property parse.key=true --property key.separator=,

