LOCATION=$1
NAME=$2

echo ${LOCATION}
echo ${NAME}

FILE_PATH=Recursi/vnets/${NAME}.yaml

#uuidgen -r


mkdir -p Recursi/vnets
cp ./templates/azure/vnet.yaml $FILE_PATH

yq --inplace ".spec.forProvider.location = \"${LOCATION}\"" $FILE_PATH
yq --inplace ".metadata.name = \"${NAME}\"" $FILE_PATH

cat $FILE_PATH