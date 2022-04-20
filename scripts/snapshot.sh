#!/bin/bash

for i in {1..5}
  do 
     echo "" >> manifests/volumesnapshot.yaml
     echo "# Snapshot time "`date` >> manifests/volumesnapshot.yaml
     oc create -f manifests/volumesnapshot.yaml
     sed -i -e "s/postgresql-snapshot-[01234]/postgresql-snapshot-$i/g" manifests/volumesnapshot.yaml
     sleep 60
 done
