#!/bin/bash

# Display various information to the screen

# Assign a value to a variable
WORD='script'

# Display the variable's value
echo "The value of variable WORD = $WORD"

# Alternate syntax
echo "This is a shell ${WORD}"

# Append text to the variable
echo "${WORD}ing is fun"

# Create a new variable
ENDING='ed'

# Combine the variables
echo "This is ${WORD}${ENDING}"

# Change the value store din the ENDING variable"
ENDING='ing'

echo "${WORD}${ENDING} is fun"

echo "The number of arguments entered is: ${#}"

for arg in $@
do
    echo $arg
done

echo "The first argument is: $1"

num=3
while [[ $num -gt 0 ]]
do
    echo "Hi, num = $num"
    ((num--))
done

exit 0
