#!/bin/bash
for (( ;; )); do
	echo -e "\033[0;32mCollecting rewards!\033[0m"
	marsd tx distribution withdraw-rewards marsvaloper18e6ahd02jz7e64xy63qh9sae3lknrckndeajf3 --from=Zaragossa --commission --chain-id=ares-1 --fees=500umars --yes
	echo -e "\033[0;32mWaiting 30 seconds before requesting balance\033[0m"
	sleep 30
	AMOUNT=$(marsd query bank balances mars18e6ahd02jz7e64xy63qh9sae3lknrckne4p8d5 | grep amount | awk '{split($0,a,"\""); print a[2]}' | head -1)
	AMOUNT=$(($AMOUNT - 500))
	AMOUNT_STRING=$AMOUNT"umars"
	echo -e "Your total balance: \033[0;32m$AMOUNT_STRING\033[0m"
	 marsd tx staking delegate marsvaloper18e6ahd02jz7e64xy63qh9sae3lknrckndeajf3 $AMOUNT_STRING --from Zaragossa --chain-id ares-1 --fees=500umars --yes
	echo -e "\033[0;32m$AMOUNT_STRING staked! Restarting in 300 sec!\033[0m"
	sleep 30
done
