#!/bin/bash

mkdir -p output

# I/O redirection
#	Redirect STDIN to a file
OUTFILE='./output/data.txt'
ERRFILE='./output/data.err'

#	Redirect STDIN to a single file
# tail -n 1 /etc/passwd > $OUTFILE 
#	Redirect STDIN to both STDOUT and a file
tail -n 1 /etc/passwd | tee $OUTFILE 

#	Redirect STDIN from a file to a program
read < $OUTFILE
echo $REPLY

#   FD 0 = STDIN
#   FD 1 = STDOUT
#   FD 2 = STDERR

# Redirect STDOUT to data.txt and STDERR to data.err
head -n 1 /etc/passwd /etc/hosts /fakefilename > $OUTFILE 2> $ERRFILE

# Redirect STDOUT and STDERR to the same file OLD WAY
head -n 1 /etc/passwd /etc/hosts /fakefilename > $OUTFILE 2>&1

# Redirect STDOUT and STDERR to the same file NEW WAY
head -n 1 /etc/passwd /etc/hosts /fakefilename &> $OUTFILE 

# Redirect STDERR to STDOUT through a pipe OLD WAY
head -n 1 /etc/passwd /etc/hosts /fakefilename 2>&1 | cat -n 

# Redirect STDERR to STDOUT through a pipe NEW WAY
head -n 1 /etc/passwd /etc/hosts /fakefilename |& cat -n 


#Redirection with file descriptors
read LINE 0<$OUTFILE
echo $LINE

# Discard STDOUT
head -n 1 /etc/passwd /etc/hosts /fakefilename 1> /dev/null

# Discard STDOUT and STDERR
head -n 1 /etc/passwd /etc/hosts /fakefilename &> /dev/null


# Remove temp files
rm $OUTFILE $ERRFILE &> /dev/null
