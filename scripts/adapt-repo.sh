NAME=$1

echo ${NAME}

FILE_PATH=Recursi/repos/${NAME}.yaml



cp ./templates/repo.yaml $FILE_PATH

yq --inplace ".spec.forProvider.name = \"${NAME}\"" $FILE_PATH
yq --inplace ".metadata.name = \"${NAME}\"" $FILE_PATH

cat $FILE_PATH