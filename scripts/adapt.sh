LOCATION=$1

cat ${LOCATION}

FILE_PATH=Recursi/vnet.yaml



cp ./templates/vnet.yaml $FILE_PATH

yq --inplace ".spec.forProvider.location = \"${LOCATION}\"" $FILE_PATH

cat $FILE_PATH