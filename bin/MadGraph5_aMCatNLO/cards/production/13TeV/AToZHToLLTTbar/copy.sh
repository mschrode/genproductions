#!/bin/bash

default=$(basename $(pwd))
#for m in 225 250 275 300 325 350 375 400 450 500 600 700 750 800 900 1000 1200 1400 1600 1800 2000
for mA in 700
do
for mH in 400
do
    echo "Copying mass (mA,mH) ($mA,$mH)"
    newdir="$default"_mA"$mA"_mH"$mH"
    mkdir $newdir
    cp "$default"_customizecards.dat $newdir/"$default"_mA"$mA"_mH"$mH"_customizecards.dat
    cp "$default"_extramodels.dat $newdir/"$default"_mA"$mA"_mH"$mH"_extramodels.dat
    cp "$default"_madspin_card.dat $newdir/"$default"_mA"$mA"_mH"$mH"_madspin_card.dat
    cp "$default"_proc_card.dat $newdir/"$default"_mA"$mA"_mH"$mH"_proc_card.dat
    cp "$default"_run_card.dat $newdir/"$default"_mA"$mA"_mH"$mH"_run_card.dat
    # modify output name
    sed -i 's/'$default'/'$default'_mA'$mA'_mH'$mH'/g' $newdir/"$default"_mA"$mA"_mH"$mH"_proc_card.dat
    # Modify mass parameter
    sed -i 's/AMASS/'$mA'.0/g' $newdir/"$default"_mA"$mA"_mH"$mH"_customizecards.dat
    sed -i 's/HMASS/'$mH'.0/g' $newdir/"$default"_mA"$mA"_mH"$mH"_customizecards.dat
done
done
