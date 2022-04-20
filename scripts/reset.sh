#!/bin/bash

# Reset volumesnapshot.yaml to the initial value
sed -i -e '/time/d' manifests/volumesnapshot.yaml 
sed -i -e '/^$/d' manifests/volumesnapshot.yaml 
sed -i -e "s/postgresql-snapshot-[012345]/postgresql-snapshot-0/g" manifests/volumesnapshot.yaml


# Delete the applications
helm uninstall postgresql-prod
helm uninstall postgresql-dev

# Delete the PVC
oc delete pvc data-postgresql-dev-0 data-postgresql-prod-0


# Delete the volumesnapshots
oc delete volumesnapshot postgresql-snapshot-0 postgresql-snapshot-1 postgresql-snapshot-2 postgresql-snapshot-3 postgresql-snapshot-4
