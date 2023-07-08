#!/bin/bash

# Display the UID and username of the user executing this script.
# Display if the user us the jleon user or not.

# Display the UID
echo "Your UID is ${UID}"

# Only display if the UID does not match 1000
UID_TO_TEST_FOR='1000'
if [[ ${UID} -ne ${UID_TO_TEST_FOR} ]]
then
    echo "Your UID does not match ${UID_TO_TEST_FOR}."
    exit 1
fi

# Display the username
USERNAME=$(whoami)

# Test if the command succeeded.
if [[ "${?}" -ne 0 ]]
then
    echo "The whoami commmand did not execute successfully"
    exit 1
fi
echo "Your username is ${USERNAME}"

# use a string test conditional
USERNAME_TO_TEST='jleon'
if [[ "${USERNAME}" = "${USERNAME_TO_TEST}" ]]
then
    echo "Your username matches ${USERNAME_TO_TEST}."
fi

# Test for != for the string
if [[ "${USERNAME}" != "${USERNAME_TO_TEST}" ]]
then
    echo "Your username does not match ${USERNAME_TO_TEST}."
    exit 1
fi
exit 0
