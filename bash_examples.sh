#!/bin/bash

echo -e "\e[34m
####################################################################################################################################
# PRINT METHODS
####################################################################################################################################
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
####################################################################################################################################
# PRIMITIVE/DATA TYPES
####################################################################################################################################
\e[39m"

echo "Primitives don't actually exist in bash. You can however, declare variables as specifc data types:"

# Set var as an int
declare -i var1
var1="thing"
echo $var1
var1="3"
echo $var1
echo

# Set var as an array
declare -a array
array=1
echo $array
array=("echo hello")
array+=("thing")
echo ${array[*]}
echo ${array[0]}
echo ${array[1]}
echo

# Constants
readonly const_var1="hello"
const_var1="world"
echo


echo -e "\e[34m
####################################################################################################################################
# VARIABLES
####################################################################################################################################
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
####################################################################################################################################
# CONDITONAL STATEMENTS
####################################################################################################################################
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
####################################################################################################################################
# LOGICAL OPERATORS
####################################################################################################################################
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
####################################################################################################################################
# FOR LOOPS
####################################################################################################################################
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
####################################################################################################################################
# WHILE LOOPS
####################################################################################################################################
\e[39m"

# Basic while loop
var1=""
while [ "${var1}" != "end" ]; do
  printf "Type end to quit:"
  read var1
  echo "You typed ${var1}"
done



echo -e "\e[34m
####################################################################################################################################
# ARRAYS
####################################################################################################################################
\e[39m"

# Intialise an array
ARRAY=() # Empty array
ARRAY=(zero one two) # Starting with content

# Print contents of an Array
echo "Referencing all contents of an array:"
echo -e "${ARRAY[*]}\n" # All contents

echo "Referencing the array variable name alone returns the first value of the array"
echo -e "${ARRAY}" # Only the first element

echo -e "Reference specific name value of array:"
echo -e "${ARRAY[2]}\n" # Reference a set element, starting at 0

# Modifying arrays
echo -e "Adding elements to arrays:"
ARRAY[3]=three # Override elements
echo -e "${ARRAY[*]}\n"

echo -e "Removing elements from arrays"
unset ARRAY[1] # Remove element from array
echo -e "${ARRAY[*]}\n"

echo -e "Remove entire array"
unset ARRAY # Remove element
echo -e "${ARRAY[*]}\n"

echo -e "Appending elements to an array"
ARRAY+=('foo')
ARRAY+=('bar')
echo ${ARRAY[*]}

# Getting the length of an array
echo -e "Length of array is: ${#ARRAY[@]}\n"



echo -e "\e[34m
####################################################################################################################################
# PRINT WITH COLOURS
####################################################################################################################################
\e[39m"

echo -e "See this website for colour options \e[36m https://misc.flogisoft.com/bash/tip_colors_and_formatting \e[39m"

echo -e "Default \e[92mLight green\e[39m"
echo -e "Default \e[91mLight red\e[39m"
echo -e "Default \e[39mDefault\e[39m"



echo -e "\e[34m
####################################################################################################################################
# OTHER STUFF
####################################################################################################################################
\e[39m"

# Convert bash script from Windows format to Linux
echo "do2unix SCRIPT_NAME_HERE"