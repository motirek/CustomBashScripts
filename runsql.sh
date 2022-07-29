#/!bin/sh

# Spustí command SQLCMD a automaticky vyplní přihlašovací údaje

read -p $'\tZadejte uživatelské jméno (Pokud bude prázdný, použije se sa): ' user
read -sp $'\tZadejte heslo: ' pswd
printf "\n"
if [ -z $user ]
then
	user="sa"
fi
if [ -z $pswd ]
then
	pswd="<YourPassword>"
fi

sqlcmd -U $user  -P $pswd

if [ ! $? -eq 0 ]
then
	printf "Špatné uživatelské jméno nebo heslo\n\tUživatelské jméno: $user\n"
fi
