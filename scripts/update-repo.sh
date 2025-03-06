NAME=$1
RENAME=$2

echo ${NAME}

FILE_PATH=Recursi/repos/${NAME}.yaml

yq --inplace ".spec.forProvider.name = \"${RENAME}\"" $FILE_PATH
yq --inplace ".metadata.name = \"${RENAME}\"" $FILE_PATH

cat $FILE_PATH