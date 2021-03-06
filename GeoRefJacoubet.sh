#/bin/bash!
orange=`tput setaf 11`
bg_orange=`tput setab 178`
purple=`tput setaf 13`
Line=`tput smul`
bold=`tput bold`
black=`tput setaf 0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 15`
reset=`tput sgr0`
bg_red=`tput setab 1`
bg_green=`tput setab 2`
bg_white=`tput setab 7`
bg_blue=`tput setab 4`
lightblue=`tput setaf 45`
lightgreen=`tput setaf 46`
bleuetern=`tput setaf 45`
ilghtpurple=`tput setaf 33`
lightred=`tput setaf 161`
darkblue=`tput setaf 19`
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd "$dir" 2>&1 &>/dev/null
mkdir -p ../_Output ../_TRASH_TEMP ../_Done_Sources

if [ -f extension_de_fichier ]
then
ext=$(cat extension_de_fichier)
echo "${white}---> Fichier_extension${green}ext = ${orange}$ext"
else
echo "${red}---> Choisir le type de fichier image${reset}"
./util.sh
ext=$(cat extension_de_fichier)
echo "${white}---> Fichier_extension${green}ext = ${orange}$ext"
fi
# Metres
#
# 1careau = 250 mètres de côté

for planche in "../"*"$ext"
do
FileDate=$(echo $(date +%Y_%m_%d_%Hh%Mm%Ss) | tr "/" "_")
# Position théorique du Pilier Géodésique de l'Observatoire de Paris
ObsPilierGeodesiqueLong=600000
ObsPilierGeodesiqueLat=126207.433191365
SimpleName=$( echo $planche| sed "s/$ext//g"| sed "s/..\///g")
PlancheNumero=$(echo $planche| sed "s/..\///g"| awk -F'.' '{print $1}')
echo "${white}---> \$SimpleName                  ${orange}$SimpleName"
echo "${white}---> \$PlancheNumero               ${orange}$PlancheNumero"
echo "${white}---> Position Origin (mètres) (Théorique) 600000 126207.433191365 Pilier Géodésique de l'Observatoire de Paris (Pas le puits)"
# 1 Planche
# mètres

ExifInfo=$(exiftool "$planche")
WidthImage=$(echo $ExifInfo | awk -F'Image Width : ' '{print $2}' | awk '{print $1}')
HeightImage=$(echo $ExifInfo | awk -F'Image Height : ' '{print $2}' | awk '{print $1}')

echo "${white}---> Largeur en pixels            ${orange}$WidthImage px"
echo "${white}---> Hauteur en pixels            ${orange}$HeightImage px"
# Cas particuliers
# 1 Planche
# mètres
Largeur=1000
Hauteur=1250
# Fin Cas particuliers
echo "${white}---> \$planche                     ${orange}$planche"
echo "${white}---> Planche N°                   ${orange}$PlancheNumero"
# Abscissa / Ordinate
if [[ "$PlancheNumero" == "1_2" ]]
then
Hauteur=1250
Largeur=2000
OriginXValeur=-4000
OriginYValeur=6250
elif [[ "$PlancheNumero" == "regle_gauche_29_carreaux" ]]
then
Hauteur=7250
Largeur=250
OriginXValeur=-4250
OriginYValeur=6000
elif [[ "$PlancheNumero" == "regle_droite_29_carreaux" ]]
then
Hauteur=7250
Largeur=250
OriginXValeur=5000
OriginYValeur=6000
elif [[ "$PlancheNumero" == "Titre" ]]
then
Hauteur=500
Largeur=5000
OriginXValeur=-2000
OriginYValeur=6500
elif [[ "$PlancheNumero" == "3" ]]
then
Hauteur=1000
OriginXValeur=-2000
OriginYValeur=6000
elif [[ "$PlancheNumero" == "4" ]]
then
Hauteur=1000
OriginXValeur=-1000
OriginYValeur=6000
elif [[ "$PlancheNumero" == "5" ]]
then
Hauteur=1000
OriginXValeur=0
OriginYValeur=6000
elif [[ "$PlancheNumero" == "6" ]]
then
Hauteur=1000
OriginXValeur=1000
OriginYValeur=6000
elif [[ "$PlancheNumero" == "7" ]]
then
Hauteur=1000
OriginXValeur=2000
OriginYValeur=6000
elif [[ "$PlancheNumero" == "8_9" ]]
then
Hauteur=1250
Largeur=2000
OriginXValeur=3000
OriginYValeur=6250
elif [[ "$PlancheNumero" == "10" ]]
then
OriginXValeur=-4000
OriginYValeur=5000
elif [[ "$PlancheNumero" == "11" ]]
then
OriginXValeur=-3000
OriginYValeur=5000
elif [[ "$PlancheNumero" == "12" ]]
then
OriginXValeur=-2000
OriginYValeur=5000
elif [[ "$PlancheNumero" == "13" ]]
then
OriginXValeur=-1000
OriginYValeur=5000
elif [[ "$PlancheNumero" == "14" ]]
then
OriginXValeur=0
OriginYValeur=5000
elif [[ "$PlancheNumero" == "15" ]]
then
OriginXValeur=1000
OriginYValeur=5000
elif [[ "$PlancheNumero" == "16" ]]
then
OriginXValeur=2000
OriginYValeur=5000
elif [[ "$PlancheNumero" == "17" ]]
then
OriginXValeur=3000
OriginYValeur=5000
elif [[ "$PlancheNumero" == "18" ]]
then
OriginXValeur=4000
OriginYValeur=5000
elif [[ "$PlancheNumero" == "19" ]]
then
OriginXValeur=-4000
OriginYValeur=3750
elif [[ "$PlancheNumero" == "20" ]]
then
OriginXValeur=-3000
OriginYValeur=3750
elif [[ "$PlancheNumero" == "21" ]]
then
OriginXValeur=-2000
OriginYValeur=3750
elif [[ "$PlancheNumero" == "22" ]]
then
OriginXValeur=-1000
OriginYValeur=3750
elif [[ "$PlancheNumero" == "23" ]]
then
OriginXValeur=0
OriginYValeur=3750
elif [[ "$PlancheNumero" == "24" ]]
then
OriginXValeur=1000
OriginYValeur=3750
elif [[ "$PlancheNumero" == "25" ]]
then
OriginXValeur=2000
OriginYValeur=3750
elif [[ "$PlancheNumero" == "26" ]]
then
OriginXValeur=3000
OriginYValeur=3750
elif [[ "$PlancheNumero" == "27" ]]
then
OriginXValeur=4000
OriginYValeur=3750
elif [[ "$PlancheNumero" == "28" ]]
then
OriginXValeur=-4000
OriginYValeur=2500
elif [[ "$PlancheNumero" == "29" ]]
then
OriginXValeur=-3000
OriginYValeur=2500
elif [[ "$PlancheNumero" == "30" ]]
then
OriginXValeur=-2000
OriginYValeur=2500
elif [[ "$PlancheNumero" == "31" ]]
then
OriginXValeur=-1000
OriginYValeur=2500
elif [[ "$PlancheNumero" == "32" ]]
then
OriginXValeur=0
OriginYValeur=2500
elif [[ "$PlancheNumero" == "33" ]]
then
OriginXValeur=1000
OriginYValeur=2500
elif [[ "$PlancheNumero" == "34" ]]
then
OriginXValeur=2000
OriginYValeur=2500
elif [[ "$PlancheNumero" == "35" ]]
then
OriginXValeur=3000
OriginYValeur=2500
elif [[ "$PlancheNumero" == "36" ]]
then
OriginXValeur=4000
OriginYValeur=2500
elif [[ "$PlancheNumero" == "37" ]]
then
OriginXValeur=-4000
OriginYValeur=1250
elif [[ "$PlancheNumero" == "38" ]]
then
OriginXValeur=-3000
OriginYValeur=1250
elif [[ "$PlancheNumero" == "39" ]]
then
OriginXValeur=-2000
OriginYValeur=1250
elif [[ "$PlancheNumero" == "39A" ]]
then
Hauteur=500
OriginXValeur=-2000
OriginYValeur=0
elif [[ "$PlancheNumero" == "40" ]]
then
Hauteur=1500
OriginXValeur=-1000
OriginYValeur=1250
elif [[ "$PlancheNumero" == "41" ]]
then
Largeur=1000
Hauteur=1750
OriginXValeur=0
OriginYValeur=1500
elif [[ "$PlancheNumero" == "42" ]]
then
OriginXValeur=1000
OriginYValeur=1250
elif [[ "$PlancheNumero" == "43" ]]
then
OriginXValeur=2000
OriginYValeur=1250
elif [[ "$PlancheNumero" == "43A" ]]
then
Hauteur=500
OriginXValeur=2000
OriginYValeur=0
elif [[ "$PlancheNumero" == "44" ]]
then
OriginXValeur=3000
OriginYValeur=1250
elif [[ "$PlancheNumero" == "45" ]]
then
OriginXValeur=4000
OriginYValeur=1250
elif [[ "$PlancheNumero" == "46_47" ]]
then
Hauteur=1500
Largeur=2000
OriginXValeur=-4000
OriginYValeur=0
elif [[ "$PlancheNumero" == "48" ]]
then
Hauteur=1000
OriginXValeur=-2000
OriginYValeur=-500
elif [[ "$PlancheNumero" == "49" ]]
then
OriginXValeur=-1000
OriginYValeur=250
elif [[ "$PlancheNumero" == "49_51_Titre_Bas" ]]
then
Hauteur=500
Largeur=3000
OriginXValeur=-1000
OriginYValeur=-1000
elif [[ "$PlancheNumero" == "50" ]]
then
OriginXValeur=0
OriginYValeur=250
elif [[ "$PlancheNumero" == "51" ]]
then
Hauteur=1000
OriginXValeur=1000
OriginYValeur=0
elif [[ "$PlancheNumero" == "52" ]]
then
Hauteur=1000
OriginXValeur=2000
OriginYValeur=-500
elif [[ "$PlancheNumero" == "53_54" ]]
then
Largeur=2000
Hauteur=1500
OriginXValeur=3000
OriginYValeur=0
fi
if [[ "OriginYValeur" -gt "1" ]]
then
NordSud=NORD
else
NordSud=SUD
fi
if [[ "OriginXValeur" -gt "1" ]]
then
EstOuest=$(echo "l'EST" )
else
EstOuest=$(echo "l'OUEST" )
fi

OrigineMetresX=$(echo $OriginXValeur+$ObsPilierGeodesiqueLong|bc -l)
OrigineMetresY=$(echo $OriginYValeur+$ObsPilierGeodesiqueLat|bc -l)
Est=$(echo $OrigineMetresX+$Largeur|bc -l)
Sud=$(echo $OrigineMetresY-$Hauteur|bc -l)
echo "${white}---> \$ObsPilierGeodesiqueLat      ${green}$ObsPilierGeodesiqueLat"
echo "${white}---> \$ObsPilierGeodesiqueLong     ${green}$ObsPilierGeodesiqueLong"
echo "${white}---> \$OrigineMetresX              ${orange}$OrigineMetresX mètres à "$EstOuest" du Pilier Géodésique de l'Observatoire de Paris"
echo "${white}---> \$OrigineMetresY              ${orange}$OrigineMetresY mètres au "$NordSud" du Pilier Géodésique de l'Observatoire de Paris"
echo "${white}---> \$Est                         ${orange}$Est"
echo "${white}---> \$Sud                         ${orange}$Sud${reset}"
gdal_translate -co COMPRESS=NONE -co ALPHA="YES" -a_srs EPSG:27561 -of GTiff -gcp 0 0 "$OrigineMetresX" "$OrigineMetresY" -gcp 0 "$HeightImage" "$OrigineMetresX" "$Sud" -gcp "$WidthImage" 0 "$Est" "$OrigineMetresY" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$planche" temp.tif

if [ -f "../_Output/TH_Jacoubet_"$SimpleName".tif" ]
then
mv "../_Output/TH_Jacoubet_"$SimpleName".tif" ../_TRASH_TEMP/"$FileDate"_TH_Jacoubet_"$SimpleName".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/TH_Jacoubet_"$SimpleName".tif"
gdaladdo -r average "../_Output/TH_Jacoubet_"$SimpleName".tif" 2 4 8 16
mv "$planche" ../_Done_Sources
done
if [ -f temp.tif ]
then
mv temp.tif ../_TRASH_TEMP/"$FileDate"_temp.tif
fi
cd - 2>&1 &>/dev/null
