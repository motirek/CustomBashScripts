#/!bin/sh

user=$(git config user.name)
token="<YourToken>"

git init
git add .
git commit -m "Automatically created"

read -p $'\tNázev repozitáře (pokud zůstane prázdný, použije se název složky): ' repo
read -p $'\tPopisek repozitáře: ' description

if [ -z $repo]
then
	repo=$(basename $(pwd))
fi

if [ -z $description]
then
	curl -i -H "Authorization: token $token" -d "{ \"name\": \"${repo}\", \"private\": true\"}" https://api.github.com/user/repos
else
	curl -i -H "Authorization: token $token" -d "{ \"name\": \"${repo}\", \"private\": true, \"description\": \"$description\"\"}" https://api.github.com/user/repos
fi

git remote add origin $token@github.com://$user/$repo.git

git remote set-url origin https://$token@github.com/$user/$repo.git 
git push --set-upstream origin master
