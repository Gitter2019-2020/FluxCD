NAME=$1

FILE_PATH=Recursi/repos/${NAME}.yaml


mkdir -p Recursi/repos
cp ./templates/github/repo.yaml $FILE_PATH

yq --inplace ".spec.forProvider.name = \"${NAME}\"" $FILE_PATH
yq --inplace ".metadata.name = \"${NAME}\"" $FILE_PATH

cat $FILE_PATH