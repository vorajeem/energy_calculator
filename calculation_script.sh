#!/bin/bash

echo "Welcome to the Prepaid vs Conventional energy usage price comparator..."
#read -p "Enter electricity energy usage (in kWh) e.g. 54.2, 764: " energy_usage
energy_usage=700

# Calculate conventional energy

VAT=0.15
conv_size_block1=500
conv_tariff_block1=175.38
conv_tariff_block1=expr $conv_tariff_block1 * $VAT
conv_size_block2=1000
conv_tariff_block2=$(( 201.27 * $VAT ))
conv_size_block3=2000
conv_tariff_block3=216.12*$VAT
conv_size_block4=3000
conv_tariff_block4=228.02*$VAT
conv_tariff_block5=239.21*$VAT

your_bill=0;

#do calculations
# Block 1
if [[ "$energy_usage" -lt "$conv_size_block1" ]]; then
	your_bill=$conv_tariff_block1*$energy_usage
else
	#block 1 full
	your_bill=$your_bill+$conv_size_block1*$conv_tariff_block1;
fi
# Block 2
if [[ "$energy_usage" -gt "$conv_size_block1" && "$energy_usage" -lt "$conv_size_block2" ]]; then
	usage_for_block=$(($energy_usage-$conv_size_block1))
	
	usage_for_block=$(($usage_for_block*$conv_tariff_block2))
	echo "USE: $usage_for_block"	
your_bill=$your_bill;
	echo "Y B: $your_bill"
fi
if [[ "$energy_usage" -gt "$conv_size_block2" ]]; then
	#block 2 full
	your_bill=$your_bill+($conv_size_block2-$conv_size_block1)*$conv_tariff_block2;
fi

# Block 3
if [[ "$energy_usage" -gt "$conv_size_block2" && "$energy_usage" -lt "$conv_size_block3" ]]; then
	your_bill=$your_bill+($energy_usage-$conv_size_block2)*$conv_tariff_block3
fi

if [["$energy_usage" -gt "$conv_size_block3"]]; then
	#block 3 full
	your_bill=$your_bill+($conv_size_block3-$conv_size_block2)*$conv_tariff_block3;

fi

# Block 4
if [[ "$energy_usage" -gt "$conv_size_block3" && "$energy_usage" -lt "$conv_size_block4" ]]; then
	your_bill=$your_bill+($energy_usage-$conv_size_block3)*$conv_tariff_block4
fi
if [[ "$energy_usage" -gt "$conv_size_block3" ]]; then
	#block4 full 
	your_bill=$your_bill+($conv_size_block4-$conv_size_block3)*$conv_tariff_block4
	
fi

# Block 5
if [[ "$energy_usage" -gt "$conv_size_block4" && "$energy_usage" -lt "$conv_size_block5" ]]; then
	your_bill=$your_bill+($energy_usage-$conv_size_block4)*$conv_tariff_block4 
fi
if [[ "$energy_usage" -gt "$conv_size_block5" ]]; then
	your_bill=$your_bill + ($energy_usage-$conv_size_block5)*$conv_tariff_block5;
fi

echo "-----------------------------------------------------"
echo "BLOCK NO. | SIZE	| TARIFF(incl. VAT)	|"
echo "-----------------------------------------------------"
echo "BLOCK 1: $conv_size_block1 | $conv_tariff_block1 |"
echo "BLOCK 2: $conv_size_block2 | $conv_tariff_block2|"
echo "BLOCK 3: $conv_size_block3 | $conv_tariff_block3|"
echo "BLOCK 4: $conv_size_block4 | $conv_tariff_block4|"
echo "BLOCK 5: $conv_size_block5 | $conv_tariff_block5|"
echo "-----------------------------------------------------"
echo "YOUR BILL (conventional): $your_bill"


conv_service_charge=209.23
conv_capacity_charge=616.37
conv_basic_charge=$service_charge+$capacity_charge


# Calculate prepaid

prepaid_basic_charge=0.00
pre_size_block_1=350
pre_tariff_block_1=182.37*$VAT
pre_size_block_2=500
pre_tariff_block_2=209.19*$VAT
pre_size_block_3=500
pre_tariff_block_3=238.36*$VAT

if [[ "$energy_usage" ]]; then

fi

if [[ "$energy_usage" ]]; then

fi


if [[ "$energy_usage" ]]; then

fi


exit 0;

