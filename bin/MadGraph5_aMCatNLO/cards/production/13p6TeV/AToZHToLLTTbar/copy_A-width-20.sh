#!/bin/bash

default=$(basename $(pwd))

skip_headers=1
while IFS=, read -r MA MH lambda2 lambda3
do
    if ((skip_headers))
    then
        ((skip_headers--))
    else
        echo "Creating cards for: MA=$MA MH=$MH"

        # specify the natural line width k=width/mass
	kA=0.20
        kH=0.03

        prefix=${default}_MA-${MA}_MH-${MH}_WA-0p2

	newdir=${prefix}
        mkdir ${newdir}
        cp ${default}_customizecards.dat ${newdir}/${prefix}_customizecards.dat
        cp ${default}_extramodels.dat ${newdir}/${prefix}_extramodels.dat
        cp ${default}_madspin_card.dat ${newdir}/${prefix}_madspin_card.dat
        cp ${default}_proc_card.dat ${newdir}/${prefix}_proc_card.dat
        cp ${default}_run_card.dat ${newdir}/${prefix}_run_card.dat
        # modify output name
        sed -i "s/${default}/${prefix}/g" ${newdir}/${prefix}_proc_card.dat
        # Modify mass parameter
        sed -i "s/AMASS/${MA}.0/g" ${newdir}/${prefix}_customizecards.dat
        sed -i "s/HMASS/${MH}.0/g" ${newdir}/${prefix}_customizecards.dat
        sed -i "s/HWIDTH/"$(bc <<< "$kH * $MH")"/g" ${newdir}/${prefix}_customizecards.dat
        sed -i "s/AWIDTH/"$(bc <<< "$kA * $MA")"/g" ${newdir}/${prefix}_customizecards.dat
        sed -i "s/lambda2/${lambda2}/g" ${newdir}/${prefix}_customizecards.dat
        sed -i "s/lambda3/${lambda3}/g" ${newdir}/${prefix}_customizecards.dat

    fi
done < points.csv 
