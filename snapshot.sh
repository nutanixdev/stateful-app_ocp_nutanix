#!/bin/bash

for i in {1..5}
  do 
     echo "" >> volumesnapshot.yaml
     echo "# Snapshot time "`date` >> volumesnapshot.yaml
     oc create -f volumesnapshot.yaml
     sed -i -e "s/postgresql-snapshot-[01234]/postgresql-snapshot-$i/g" volumesnapshot.yaml
     sleep 30
 done
