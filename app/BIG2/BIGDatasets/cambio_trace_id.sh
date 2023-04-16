
#!/bin/bash

FILE=$1
COUNTER=0
while read -r line;
do
    echo $line | sed -E 's/trace_[0-9]+/trace_$COUNTER/g' ;
done > provissima.txt