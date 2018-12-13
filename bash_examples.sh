#!/bin/bash

echo -e "\e[34m
##################################################################
# PRINT METHODS
##################################################################
\e[39m"
# Basic print
echo "Basic print with echo"
echo

# Extended prints
echo -e "Use extended characters with echo -e\n"

printf "Use printf for additional functionality\n"
echo

# Multi-line print
echo "You can also
split output across
multiple lines"
echo



echo -e "\e[34m
##################################################################
# PRIMITIVE/DATA TYPES
##################################################################
\e[39m"




echo -e "\e[34m
##################################################################
# VARIABLES
##################################################################
\e[39m"
# Set Variable
echo -e "Set variables using NAME_HERE=foo\n"
var1="foo"

# Reference variable
echo -e "Reference variables using \${NAME_HERE}"
echo -e "var1=${var1}\n"

# Set variable based on command return
echo "Set a variable based on a command:"
var1="$(hostname)"
echo -e "Server name is ${var1}\n"



echo -e "\e[34m
##################################################################
# CONDITONAL STATEMENTS
##################################################################
\e[39m"
# If statement
echo -e "Basic if statement"
if [ "THING" == "THING" ]; then
  echo -e "True\n"
fi

# If Else statement
echo -e "Else if"
var1="THING"
if [ "${var1}" == "THING" ]; then
  echo -e "True\n"
else
  echo -e "False\n"
fi

# If > else if > else statement
echo -e "If with AND operator"
var1="OTHER"
if [ "${var1}" == "THING" ]; then
  echo -e "It's THING\n"
elif [ "${var1}" == "OTHER" ]; then
  echo -e "It's OTHER\n"
else
  echo -e "It's something else\n"
fi

# Case Statement
echo "Case statement: note that these evaluate on pattern matching and not conditional statements."
echo "Due to pattern matching, this will work with regex"
var1="3"
case "${var1}" in
  0)
    echo "It's 0"
    ;;
  1)
    echo "It's 1"
    ;;
  [2-9])
    echo "It's between 2-9"
    ;;
  [1-9][0-9])
    echo "It's between 10-99"
    ;;
  *)
    echo "It's something else"
  ;;
esac

echo -e "\e[34m
##################################################################
# LOGICAL OPERATORS
##################################################################
\e[39m"

echo -e "Visit \e[36m https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php \e[39m for a list of operators\n"

# AND Operator
echo -e "If statement with AND operator"
var1="THING"
var2="OTHER"
if [ "${var1}" == "THING" ] && [ "${var2}" == "OTHER" ]; then
  echo -e "It's THING AND OTHER\n"
elif [ "${var1}" == "OTHER" ]; then
  echo -e "It's just OTHER\n"
else
  echo -e "It's something else\n"
fi

# OR Operator
echo -e "If statement with OR operator"
var1="THING"
var2="JACK"
if [ "${var1}" == "THING" ] || [ "${var2}" == "OTHER" ]; then
  echo -e "It's THING OR OTHER\n"
elif [ "${var1}" == "BLOB" ]; then
  echo -e "It's BLOB\n"
else
  echo -e "It's something else\n"
fi

# NOT Operator
echo -e "If statement with OR operator"
var1="JACK"
if [ "${var1}" != "THING" ] ; then
  echo -e "It's not THING\n"
elif [ "${var1}" == "THING" ]; then
  echo -e "It's THING\n"
else
  echo -e "It's something else\n"
fi

echo -e "\e[34m
##################################################################
# FOR LOOPS
##################################################################
\e[39m"

# Different variations of defining lists for loops
echo -e "Basic for loop:"
for i in 1 2 3 4 5; do
  echo "Iteration ${i}"
done
echo

echo -e "For loop using space delimited names:"
LIST_OF_THINGS="1 2 3 4 5"
for i in ${LIST_OF_THINGS}; do
  echo "Iteration ${i}"
done
echo

echo -e "For loop iterating over define range:"
for i in {1..5}; do
  echo "Iteration ${i}"
done
echo

echo -e "For loop over range with defined increment of 2:"
for i in {0..10..2}; do
  echo "Iteration ${i}"
done
echo

# Break out of loop
echo -e "Breaking a loop prematurely:"
for i in 1 2 3 4 5; do
  if [ "${i}" == 3 ]; then
    echo "Reached 3. Breaking out."
    break #Abandon the loop.
  fi
  echo "Iteration ${i}"
done
echo

# Continue on to next loop iteration
echo -e "Breaking a loop incrememt prematurely:"
for i in 1 2 3 4 5; do
  if [ "${i}" == 3 ]; then
    echo "Reached 3. Breaking out."
    continue #Abandon this iteration
  fi
  echo "Iteration ${i}"
done
echo

echo -e "\e[34m
##################################################################
# WHILE LOOPS
##################################################################
\e[39m"

######################
# ARRAYS
######################

# Intialise an array
ARRAY=() # Empty array
ARRAY=(zero one two) # Starting with content

# Print contents of an Array
echo "Referencing all contents of an array:"
echo ${ARRAY[*]} # All contents

echo "Referencing the array variable name alone returns the first value of the array"
echo ${ARRAY} #
echo ${ARRAY[2]}
ARRAY[3]=four
echo ${ARRAY[*]}
unset ARRAY[1]
echo ${ARRAY[*]}
unset ARRAY
echo ${ARRAY[*]}
ARRAY+=('foo')
ARRAY+=('bar')
echo ${ARRAY[*]}
echo ${#ARRAY[@]}

######################
# PRINTING COLOURS
######################

echo "See this website for colour options https://misc.flogisoft.com/bash/tip_colors_and_formatting"

echo -e "Default \e[92mLight green"
echo -e "Default \e[91mLight red"
echo -e "Default \e[39mDefault"

######################
# STANDARD OUTPUT OPTIONS
######################


### OTHER STUFF

# Convert bash script from Windows format to Linux
echo "do2unix SCRIPT_NAME_HERE"