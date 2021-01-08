#!/bin/bash

counter=0

while [ $counter -lt 6 ]; do
  let counter=counter+1
  age=$(shuf -i 20-50 -n 1)
  
  name=$(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $1}')
  lastname=$(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $2}')
  echo "$name, $lastname"

  mysql -u root -p1234 people -e "insert into register values($counter, '$name', '$lastname', $age);"
  echo "$counter $name $lastname was inserted"
done
