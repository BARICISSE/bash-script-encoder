#! /bin/bash

#starts question 2

string3=$(while read line; do echo "$line"; done < $1)

codebook=`echo $string3 | cut -f1 -d" " `
codebook2=`echo $string3 | cut -f2 -d" " `
string1=abcdefghijklmnopqrstuvwxyz
String2=ABCDEFGHIJKLMNOPQRSTUVWXYZ


#Encryption part

input=$(cat $2)



for (( i=0; i<${#input}; i++ )); do

  var="${input:$i:1}"
 x=${string1%%$var*};
 rank="$((${#x}+1))"
if [[ $var == [[:alpha:]] ]]  
then 
          if [[ $var =~ [A-Z] ]]
          then
            y=` echo "$var" | tr "[:upper:]" "[:lower:]"`
            b=${string1%%$y*};
            rank="$((${#b}+1))"
            ans+=$"`expr substr "$codebook2" $rank 1`"
          else 
            ans+=$"`expr substr "$codebook" $rank 1`"
          fi
else 
m=$var
  ans+="$m"
fi
done
echo $ans 




# Another Method

#secret=$( cat $2 )
#code=$( cat $1 )
#codeLine1=$(cat $1 | sed -n 1p)
#codeLine2=$(cat $1 | sed -n 2p)
#entireCode=$codeLine1$codeLine2

#echo $entireCode
#echo $secret | tr  $entireCode abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ

