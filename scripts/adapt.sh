LOCATION=$1

FILE_PATH=Recursi/vnet.yaml



cp ./templates/vnet.yaml $FILE_PATH

yq --inplace ".spec.location = \"${LOCATION}\"" $FILE_PATH