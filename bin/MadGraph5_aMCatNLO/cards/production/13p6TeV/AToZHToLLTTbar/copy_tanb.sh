#!/bin/bash

default=$(basename $(pwd))

skip_headers=1
while IFS=, read -r MA MH tanb WidthA WidthH lambda2 lambda3
do
    if ((skip_headers))
    then
        ((skip_headers--))
    else
        echo "Creating cards for: MA=$MA MH=$MH tanb=$tanb WidthA=$WidthA WidthH=$WidthH"

        prefix="$default"_tanb-"$tanb"_MA-"$MA"_MH-"$MH"

	newdir=$prefix
        mkdir $newdir
	
        cp "$default"_customizecards.dat $newdir/"$prefix"_customizecards.dat
        cp "$default"_extramodels.dat $newdir/"$prefix"_extramodels.dat
        cp "$default"_madspin_card.dat $newdir/"$prefix"_madspin_card.dat
        cp "$default"_proc_card.dat $newdir/"$prefix"_proc_card.dat
        cp "$default"_run_card.dat $newdir/"$prefix"_run_card.dat
        # modify output name
        sed -i "s/"$default"/"$prefix"/g" $newdir/"$prefix"_proc_card.dat
        # Modify mass parameter
        sed -i "s/AMASS/"$MA".0/g" $newdir/"$prefix"_customizecards.dat
        sed -i "s/HMASS/"$MH".0/g" $newdir/"$prefix"_customizecards.dat
        sed -i "s/AWIDTH/"$WidthA"/g" $newdir/"$prefix"_customizecards.dat
        sed -i "s/HWIDTH/"$WidthH"/g" $newdir/"$prefix"_customizecards.dat
        sed -i "s/lambda2/"$lambda2"/g" $newdir/"$prefix"_customizecards.dat
        sed -i "s/lambda3/"$lambda3"/g" $newdir/"$prefix"_customizecards.dat

    fi
done < $1
