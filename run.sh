
read -p 'Org name: ' org
read -p 'Repo name contains: ' repo_filter
read -p 'file name: ' file_name
echo
for repo in $(gh repo list $org -L 700 --json name --jq '.[].name' | grep $repo_filter)
do
        gh repo clone $repo
        cd $repo
        cp ../$file_name $file_name
        git add .
        git commit -m"Added File $file_name"
        git push
        cd ..
        rm -rf $repo
done
