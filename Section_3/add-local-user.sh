if [[ $UID -ne 0 ]]
then
    echo "Please execute the script with root privileges."
    exit 1
fi

read -p "Enter the username for the new account: "
USERNAME=$REPLY
read -p "Enter the real name of the user of the new account: "
COMMENT=$REPLY
read -p "Enter the initial password for the user account: "
PASSWORD=$REPLY

useradd -c "$COMMENT" -M $USERNAME

if [[ $? -ne 0 ]]
then
    echo "An error ocurred while adding the new user account."
    exit 1
fi

echo "${USERNAME}:${PASSWORD}" | chpasswd
passwd -e $USERNAME

if [[ $? -ne 0 ]]
then
    HOSTNAME=hostname
    echo "User account successfully created for user: ${USERNAME} under hostname: ${HOSTNAME}"
fi

exit 0
