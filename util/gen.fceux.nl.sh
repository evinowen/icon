#!/bin/bash

function usage {
  echo
  echo "NAME"
  echo -e "\tgen.fceux.nl - Generate FCEUX .nl files for debugging"
  echo
  echo "SYNOPSIS"
  echo -e "\t$0 [DBG FILE] [NL FILE PREFIX]"
  echo
  exit 1
}

if [ -z "$1" ]; then
  echo "Error: No source dbg file provided to parse."
  usage
fi

if [ -z "$2" ]; then
  echo "Error: No target prefix provided for output."
  usage
fi

start=`date +%s%N`
echo; echo "Clean $1 ... "
grep "^sym" $1                                                      \
  | grep -v "LOCAL-MACRO_SYMBOL"                                    \
  | cut -f 2                                                        \
  | sed -r 's/(^|,)(id|addrsize|def|ref|type|size|seg)=[^,]*//g'    \
  | sed -r 's/(val=0x)([^,]*)(,|$)/val=0000\2/g'                    \
  | sed -r 's/val=0*([0-7][^,][^,][^,])(,|$)/bank=ram,val=\1/g'     \
  | sed -r 's/val=0*([8-9A-Fa-f][^,][^,][^,])(,|$)/bank=0,val=\1/g' \
  > "$1.cln"

target="$2.ram.nl"
grep "bank=ram" "$1.cln"                                       \
  | sed -r 's/val=0*([0-7][^,][^,][^,])(,|$)/val=\1/g'         \
  | sed -r 's/(^,|"|(name|scope|val|bank)=)//g'                \
  | awk -F, '{ printf "$%s#%s#\n", $4, $1 }'                   \
  > "$target"
echo; echo " ... created $target"

target="$2.0.nl"
grep "bank=0" "$1.cln"                                         \
  | sed -r 's/val=0*([8-9A-Fa-f][^,][^,][^,])(,|$)/val=\1/g'   \
  | sed -r 's/(^,|"|(name|scope|val|bank)=)//g'                \
  | awk -F, '{ printf "$%s#%s#\n", $4, $1 }'                   \
  > "$target"
echo; echo " ... created $target"


echo; echo " ... complete."
now=`date +%s%N`
echo $(($((now - start))/1000000))
