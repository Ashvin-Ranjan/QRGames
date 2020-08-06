#! /bin/bash
BASE="\033["
reset(){
clear
echo "╔═══════════════════════╗"
sleep .5
echo "║ Created by davidhcefx ║"
sleep .5
echo "║Edited by Ashvin Ranjan║"
sleep .5
echo "║       28/5/2020       ║"
sleep .5
echo "║TicTacToe game in bash!║"
Arr=(■ ■ ■ ■ ■ ■ ■ ■ ■)
player=1
gamestatus=1
sleep .5
echo "╠═══════════════════════╣"
sleep .5
echo "║      Game started     ║"
sleep .5
echo "╚═══════════════════════╝"
sleep .5
}
sets(){
idx=$(( $1 * 3 + $2 ))
if [ ${Arr[$idx]} == "■" ];then 
Arr[$idx]=$3
player=$((player%2+1))
else
echo "You can't place there!"
fi
}
print(){
echo "   ${BASE}1;34m0 1 2${BASE}0m"
echo "${BASE}0;37m0${BASE}0m  ${Arr[0]} ${Arr[1]} ${Arr[2]}"
echo "${BASE}0;37m1${BASE}0m  ${Arr[3]} ${Arr[4]} ${Arr[5]}"
echo "${BASE}0;37m2${BASE}0m  ${Arr[6]} ${Arr[7]} ${Arr[8]}"
}
checkmatch(){
if [ ${Arr[$1]} != "■" ] && [ ${Arr[$1]} == ${Arr[$2]} ] && [ ${Arr[$2]} == ${Arr[$3]} ]; then
gamestatus=0
fi
}
checkgame(){
checkmatch 0 1 2
checkmatch 3 4 5
checkmatch 6 7 8
checkmatch 0 3 6
checkmatch 1 4 7
checkmatch 2 5 8
checkmatch 0 4 8
checkmatch 2 4 6
}
reset
while [ 1 == 1 ]; do
echo ""
if [ $player == 1 ]; then sym=O
else sym=X; fi
echo "Player $player's turn: ($sym)"
print
echo ""
echo "╔═════════════════════╗"
echo "║Command:             ║"
echo "║1. set [${BASE}1;34mrow${BASE}0m] [${BASE}0;37mcolumn${BASE}0m]║"
echo "║2. ${BASE}0;32mrestart${BASE}0m           ║"
echo "║3. ${BASE}0;31mquit${BASE}0m              ║"
echo "╚═════════════════════╝"
while [ 1 == 1 ]; do
read -r cmd a b
if [ $cmd == "set" ]; then
sets $b $a $sym
break
elif [ $cmd == "restart" ]; then
reset
break
elif [ $cmd == "quit" ]; then
exit 0
break
else
echo "wrong command, try again."
fi
done
checkgame
if [ $gamestatus != 1 ]; then
echo "Gameover"
player=$((player%2+1))
echo "Player $player ($sym) wins."
exit 0
fi
done
