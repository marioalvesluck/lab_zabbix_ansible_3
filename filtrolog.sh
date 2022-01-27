#/bin/bash

awk '{
  inicio=$9
  final=$9 $10
  if (inicio == "---------------") {flag=1}
  if(final == "TotalTablespaces") {flag=0}
  if (flag == 1 && $9 != "---------------" && $9 != "") {
    print $12

  }
}' $1
