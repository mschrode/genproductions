#!/bin/bash

default=$(basename $(pwd))

is=(1000 2100 900 500 2100 1500 1500 2100 500 700 1200 1800 500 700 900 700 900 1200 1500 1800 2100 800 800 1000 1000 1200)
js=(600 2000 350 400 1000 1400 1000 1600 350 350 850 1600 370 370 370 400 400 400 400 400 400 600 650 700 800 1000)
for idx in "${!is[@]}"; do
   mA=${is[$idx]}
   mH=${js[$idx]}
   ks=0.03
   echo $wA
    echo "Copying mass (mA,mH)" # ($mA,$mH)
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
    sed -i 's/HWIDTH/'$(bc <<< "$ks * $mH")'/g' $newdir/"$default"_mA"$mA"_mH"$mH"_customizecards.dat
    sed -i 's/AWIDTH/'$(bc <<< "$ks * $mA")'/g' $newdir/"$default"_mA"$mA"_mH"$mH"_customizecards.dat
done

sed -i 's/lambda2/-11.88587/g' AZHToNuNutt_mA1000_mH600/AZHToNuNutt_mA1000_mH600_customizecards.dat
sed -i 's/lambda3/11.04078/g' AZHToNuNutt_mA1000_mH600/AZHToNuNutt_mA1000_mH600_customizecards.dat 

sed -i 's/lambda2/-11.53552/g' AZHToNuNutt_mA1000_mH700/AZHToNuNutt_mA1000_mH700_customizecards.dat
sed -i 's/lambda3/8.16190/g' AZHToNuNutt_mA1000_mH700/AZHToNuNutt_mA1000_mH700_customizecards.dat

sed -i 's/lambda2/-10.34045/g' AZHToNuNutt_mA1000_mH800/AZHToNuNutt_mA1000_mH800_customizecards.dat
sed -i 's/lambda3/8.98175/g' AZHToNuNutt_mA1000_mH800/AZHToNuNutt_mA1000_mH800_customizecards.dat

sed -i 's/lambda2/-11.53552/g' AZHToNuNutt_mA1200_mH1000/AZHToNuNutt_mA1200_mH1000_customizecards.dat
sed -i 's/lambda3/8.16190/g' AZHToNuNutt_mA1200_mH1000/AZHToNuNutt_mA1200_mH1000_customizecards.dat

sed -i 's/lambda2/-21.52136/g' AZHToNuNutt_mA1200_mH400/AZHToNuNutt_mA1200_mH400_customizecards.dat
sed -i 's/lambda3/21.46644/g' AZHToNuNutt_mA1200_mH400/AZHToNuNutt_mA1200_mH400_customizecards.dat

sed -i 's/lambda2/-14.83442/g' AZHToNuNutt_mA1200_mH850/AZHToNuNutt_mA1200_mH850_customizecards.dat
sed -i 's/lambda3/12.55715/g' AZHToNuNutt_mA1200_mH850/AZHToNuNutt_mA1200_mH850_customizecards.dat

sed -i 's/lambda2/-24.89667/g' AZHToNuNutt_mA1500_mH1000/AZHToNuNutt_mA1500_mH1000_customizecards.dat
sed -i 's/lambda3/21.52305/g' AZHToNuNutt_mA1500_mH1000/AZHToNuNutt_mA1500_mH1000_customizecards.dat

sed -i 's/lambda2/-13.48428/g' AZHToNuNutt_mA1500_mH1400/AZHToNuNutt_mA1500_mH1400_customizecards.dat
sed -i 's/lambda3/6.31786/g' AZHToNuNutt_mA1500_mH1400/AZHToNuNutt_mA1500_mH1400_customizecards.dat

sed -i 's/lambda2/-34.88251/g' AZHToNuNutt_mA1500_mH400/AZHToNuNutt_mA1500_mH400_customizecards.dat
sed -i 's/lambda3/34.82759/g' AZHToNuNutt_mA1500_mH400/AZHToNuNutt_mA1500_mH400_customizecards.dat

sed -i 's/lambda2/-60.52640/g' AZHToNuNutt_mA2100_mH1000/AZHToNuNutt_mA2100_mH1000_customizecards.dat
sed -i 's/lambda3/57.15278/g' AZHToNuNutt_mA2100_mH1000/AZHToNuNutt_mA2100_mH1000_customizecards.dat

sed -i 's/lambda2/-22.68184/g' AZHToNuNutt_mA1800_mH1600/AZHToNuNutt_mA1800_mH1600_customizecards.dat
sed -i 's/lambda3/13.14491/g' AZHToNuNutt_mA1800_mH1600/AZHToNuNutt_mA1800_mH1600_customizecards.dat

sed -i 's/lambda2/-51.21280/g' AZHToNuNutt_mA1800_mH400/AZHToNuNutt_mA1800_mH400_customizecards.dat
sed -i 's/lambda3/51.15788/g' AZHToNuNutt_mA1800_mH400/AZHToNuNutt_mA1800_mH400_customizecards.dat

sed -i 's/lambda2/-41.98127/g' AZHToNuNutt_mA2100_mH1600/AZHToNuNutt_mA2100_mH1600_customizecards.dat
sed -i 's/lambda3/32.44435/g' AZHToNuNutt_mA2100_mH1600/AZHToNuNutt_mA2100_mH1600_customizecards.dat

sed -i 's/lambda2/-24.86269/g' AZHToNuNutt_mA2100_mH2000/AZHToNuNutt_mA2100_mH2000_customizecards.dat
sed -i 's/lambda3/9.63657/g' AZHToNuNutt_mA2100_mH2000/AZHToNuNutt_mA2100_mH2000_customizecards.dat

sed -i 's/lambda2/-70.51224/g' AZHToNuNutt_mA2100_mH400/AZHToNuNutt_mA2100_mH400_customizecards.dat
sed -i 's/lambda3/70.45732/g' AZHToNuNutt_mA2100_mH400/AZHToNuNutt_mA2100_mH400_customizecards.dat

sed -i 's/lambda2/-2.33782/g' AZHToNuNutt_mA500_mH350/AZHToNuNutt_mA500_mH350_customizecards.dat
sed -i 's/lambda3/2.43105/g' AZHToNuNutt_mA500_mH350/AZHToNuNutt_mA500_mH350_customizecards.dat

sed -i 's/lambda2/-2.16663/g' AZHToNuNutt_mA500_mH370/AZHToNuNutt_mA500_mH370_customizecards.dat
sed -i 's/lambda3/2.20297/g' AZHToNuNutt_mA500_mH370/AZHToNuNutt_mA500_mH370_customizecards.dat

sed -i 's/lambda2/-1.89202/g' AZHToNuNutt_mA500_mH400/AZHToNuNutt_mA500_mH400_customizecards.dat
sed -i 's/lambda3/1.83709/g' AZHToNuNutt_mA500_mH400/AZHToNuNutt_mA500_mH400_customizecards.dat

sed -i 's/lambda2/-6.29667/g' AZHToNuNutt_mA700_mH350/AZHToNuNutt_mA700_mH350_customizecards.dat
sed -i 's/lambda3/6.38991/g' AZHToNuNutt_mA700_mH350/AZHToNuNutt_mA700_mH350_customizecards.dat

sed -i 's/lambda2/-6.12549/g' AZHToNuNutt_mA700_mH370/AZHToNuNutt_mA700_mH370_customizecards.dat
sed -i 's/lambda3/6.16183/g' AZHToNuNutt_mA700_mH370/AZHToNuNutt_mA700_mH370_customizecards.dat

sed -i 's/lambda2/-5.85088/g' AZHToNuNutt_mA700_mH400/AZHToNuNutt_mA700_mH400_customizecards.dat
sed -i 's/lambda3/5.79595/g' AZHToNuNutt_mA700_mH400/AZHToNuNutt_mA700_mH400_customizecards.dat

sed -i 's/lambda2/-5.94758/g' AZHToNuNutt_mA800_mH600/AZHToNuNutt_mA800_mH600_customizecards.dat
sed -i 's/lambda3/5.10249/g' AZHToNuNutt_mA800_mH600/AZHToNuNutt_mA800_mH600_customizecards.dat

sed -i 's/lambda2/-5.20459/g' AZHToNuNutt_mA800_mH650/AZHToNuNutt_mA800_mH650_customizecards.dat
sed -i 's/lambda3/4.11257/g' AZHToNuNutt_mA800_mH650/AZHToNuNutt_mA800_mH650_customizecards.dat

sed -i 's/lambda2/-11.57515/g' AZHToNuNutt_mA900_mH350/AZHToNuNutt_mA900_mH350_customizecards.dat
sed -i 's/lambda3/11.66838/g' AZHToNuNutt_mA900_mH350/AZHToNuNutt_mA900_mH350_customizecards.dat

sed -i 's/lambda2/-11.40397/g' AZHToNuNutt_mA900_mH370/AZHToNuNutt_mA900_mH370_customizecards.dat
sed -i 's/lambda3/11.44031/g' AZHToNuNutt_mA900_mH370/AZHToNuNutt_mA900_mH370_customizecards.dat

sed -i 's/lambda2/-11.12936/g' AZHToNuNutt_mA900_mH400/AZHToNuNutt_mA900_mH400_customizecards.dat
sed -i 's/lambda3/11.07443/g' AZHToNuNutt_mA900_mH400/AZHToNuNutt_mA900_mH400_customizecards.dat
