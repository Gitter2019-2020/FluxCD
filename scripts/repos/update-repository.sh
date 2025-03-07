OLD_NAME=$1
NEW_NAME=$2

OLD_FILE_PATH=Recursi/repos/${OLD_NAME}.yaml
NEW_FILE_PATH=Recursi/repos/${NEW_NAME}.yaml

echo cat $OLD_FILE_PATH

OLD_META=$(yq ".metadata.name" $OLD_FILE_PATH)

echo $OLD_META

#create new file with old metadata.name
cp ./templates/repo.yaml $NEW_FILE_PATH
yq --inplace ".spec.forProvider.name = \"${NEW_NAME}\"" $NEW_FILE_PATH
yq --inplace ".metadata.name = \"${OLD_META}\"" $NEW_FILE_PATH

#remove OLD_NAME file
rm $OLD_FILE_PATH

cat $NEW_FILE_PATH