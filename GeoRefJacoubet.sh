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
mkdir -p ../_Output ../_TRASH_TEMP
# Pieds
#
# 1 toise  = 6 pieds
# 1 careau = 200 toises
# 1 careau = 1200 pieds
# 1 pieds du roi (Charlemagne) = 0.324839385
if [ -f extenssion_de_fichier ]
then
ext=$(cat extenssion_de_fichier)
echo "${white}---> Fichier_extenssion${green}ext = ${orange}$ext"
else
echo "${red}---> Choisir le type de fichier image${reset}"
./util.sh
ext=$(cat extenssion_de_fichier)
echo "${white}---> Fichier_extenssion${green}ext = ${orange}$ext"
fi
# Metres
#
# 1careau = 389.807262 mètres de côté

# Position du coin superieur gauche d'une planche = la postion du pilier géodésique - 2 careaux en logitude et + un careau en latitude
#echo ext $ext
for planche in "../"*_Edme_Verniquet"$ext"
do
FileDate=$(echo $(date +%Y_%m_%d_%Hh%Mm%Ss) | tr "/" "_")
# Position théorique du Pilier Géodésique de l'Observatoire de Paris
ObsPilierGeodesiqueLong=600000
ObsPilierGeodesiqueLat=126207.433191365
SimpleName=$( echo $planche| sed "s/$ext//g"| sed "s/..\///g")
PlancheNumero=$(echo $planche| awk -F'_Edme_Verniquet' '{print $1}'| awk -F'Planche-' '{print $2}')
echo "${white}---> \$SimpleName                  ${orange}$SimpleName"
echo "${white}---> \$PlancheNumero               ${orange}$PlancheNumero"
echo "${white}---> Position Origin (mètres) (Théorique) 600000 126207.433191365 Pilier Géodésique de l'Observatoire de Paris (Pas le puits)"
# 1 Planche
# mètres
Hauteur=779.614524
ExifInfo=$(exiftool "$planche")
WidthImage=$(echo $ExifInfo | awk -F'Image Width : ' '{print $2}' | awk '{print $1}')
HeightImage=$(echo $ExifInfo | awk -F'Image Height : ' '{print $2}' | awk '{print $1}')

echo "${white}---> Largeur en pixels            ${orange}$WidthImage px"
echo "${white}---> Hauteur en pixels            ${orange}$HeightImage px"
# Cas particuliers
if [[ "$PlancheNumero" == "1" ]]||[[ "$PlancheNumero" == "9" ]]||[[ "$PlancheNumero" == "17" ]]||[[ "$PlancheNumero" == "25" ]]||[[ "$PlancheNumero" == "33" ]]||[[ "$PlancheNumero" == "41" ]]||[[ "$PlancheNumero" == "49" ]]||[[ "$PlancheNumero" == "57" ]]||[[ "$PlancheNumero" == "65" ]]
then
# 1 Planche
# mètres
Largeur=779.614524
else
# 1 Planche
# mètres
Largeur=1169.421786
fi
# Fin Cas particuliers
echo "${white}---> Hauteur en (Toises)          ${orange}400 T"
echo "${white}---> Hauteur en (mètres)          ${orange}779.614524 m"
echo "${white}---> \$planche                     ${orange}$planche"
echo "${white}---> Planche N°                   ${orange}$PlancheNumero"
# Abscissa / Ordinate
if [[ "$PlancheNumero" == "1" ]]
then
OriginXToises=-2000
OriginYToises=3000
elif [[ "$PlancheNumero" == "2" ]]
then
OriginXToises=-1600
OriginYToises=3000
elif [[ "$PlancheNumero" == "3" ]]
then
OriginXToises=-1000
OriginYToises=3000
elif [[ "$PlancheNumero" == "4" ]]
then
OriginXToises=-400
OriginYToises=3000
elif [[ "$PlancheNumero" == "5" ]]
then
OriginXToises=200
OriginYToises=3000
elif [[ "$PlancheNumero" == "6" ]]
then
OriginXToises=800
OriginYToises=3000
elif [[ "$PlancheNumero" == "7" ]]
then
OriginXToises=1400
OriginYToises=3000
elif [[ "$PlancheNumero" == "8" ]]
then
OriginXToises=2000
OriginYToises=3000
elif [[ "$PlancheNumero" == "9" ]]
then
OriginXToises=-2000
OriginYToises=2600
elif [[ "$PlancheNumero" == "10" ]]
then
OriginXToises=-1600
OriginYToises=2600
elif [[ "$PlancheNumero" == "11" ]]
then
OriginXToises=-1000
OriginYToises=2600
elif [[ "$PlancheNumero" == "12" ]]
then
OriginXToises=-400
OriginYToises=2600
elif [[ "$PlancheNumero" == "13" ]]
then
OriginXToises=200
OriginYToises=2600
elif [[ "$PlancheNumero" == "14" ]]
then
OriginXToises=800
OriginYToises=2600
elif [[ "$PlancheNumero" == "15" ]]
then
OriginXToises=1400
OriginYToises=2600
elif [[ "$PlancheNumero" == "16" ]]
then
OriginXToises=2000
OriginYToises=2600
elif [[ "$PlancheNumero" == "17" ]]
then
OriginXToises=-2000
OriginYToises=2200
elif [[ "$PlancheNumero" == "18" ]]
then
OriginXToises=-1600
OriginYToises=2200
elif [[ "$PlancheNumero" == "19" ]]
then
OriginXToises=-1000
OriginYToises=2200
elif [[ "$PlancheNumero" == "20" ]]
then
OriginXToises=-400
OriginYToises=2200
elif [[ "$PlancheNumero" == "21" ]]
then
OriginXToises=200
OriginYToises=2200
elif [[ "$PlancheNumero" == "22" ]]
then
OriginXToises=800
OriginYToises=2200
elif [[ "$PlancheNumero" == "23" ]]
then
OriginXToises=1400
OriginYToises=2200
elif [[ "$PlancheNumero" == "24" ]]
then
OriginXToises=2000
OriginYToises=2200
elif [[ "$PlancheNumero" == "25" ]]
then
OriginXToises=-2000
OriginYToises=1800
elif [[ "$PlancheNumero" == "26" ]]
then
OriginXToises=-1600
OriginYToises=1800
elif [[ "$PlancheNumero" == "27" ]]
then
OriginXToises=-1000
OriginYToises=1800
elif [[ "$PlancheNumero" == "28" ]]
then
OriginXToises=-400
OriginYToises=1800
elif [[ "$PlancheNumero" == "29" ]]
then
OriginXToises=200
OriginYToises=1800
elif [[ "$PlancheNumero" == "30" ]]
then
OriginXToises=800
OriginYToises=1800
elif [[ "$PlancheNumero" == "31" ]]
then
OriginXToises=1400
OriginYToises=1800
elif [[ "$PlancheNumero" == "32" ]]
then
OriginXToises=2000
OriginYToises=1800
elif [[ "$PlancheNumero" == "33" ]]
then
OriginXToises=-2000
OriginYToises=1400
elif [[ "$PlancheNumero" == "34" ]]
then
OriginXToises=-1600
OriginYToises=1400
elif [[ "$PlancheNumero" == "35" ]]
then
OriginXToises=-1000
OriginYToises=1400
elif [[ "$PlancheNumero" == "36" ]]
then
OriginXToises=-400
OriginYToises=1400
elif [[ "$PlancheNumero" == "37" ]]
then
OriginXToises=200
OriginYToises=1400
elif [[ "$PlancheNumero" == "38" ]]
then
OriginXToises=800
OriginYToises=1400
elif [[ "$PlancheNumero" == "39" ]]
then
OriginXToises=1400
OriginYToises=1400
elif [[ "$PlancheNumero" == "40" ]]
then
OriginXToises=2000
OriginYToises=1400
elif [[ "$PlancheNumero" == "41" ]]
then
OriginXToises=-2000
OriginYToises=1000
elif [[ "$PlancheNumero" == "42" ]]
then
OriginXToises=-1600
OriginYToises=1000
elif [[ "$PlancheNumero" == "43" ]]
then
OriginXToises=-1000
OriginYToises=1000
elif [[ "$PlancheNumero" == "44" ]]
then
OriginXToises=-400
OriginYToises=1000
elif [[ "$PlancheNumero" == "45" ]]
then
OriginXToises=200
OriginYToises=1000
elif [[ "$PlancheNumero" == "46" ]]
then
OriginXToises=800
OriginYToises=1000
elif [[ "$PlancheNumero" == "47" ]]
then
OriginXToises=1400
OriginYToises=1000
elif [[ "$PlancheNumero" == "48" ]]
then
OriginXToises=2000
OriginYToises=1000
elif [[ "$PlancheNumero" == "49" ]]
then
OriginXToises=-2000
OriginYToises=600
elif [[ "$PlancheNumero" == "50" ]]
then
OriginXToises=-1600
OriginYToises=600
elif [[ "$PlancheNumero" == "51" ]]
then
OriginXToises=-1000
OriginYToises=600
elif [[ "$PlancheNumero" == "52" ]]
then
OriginXToises=-400
OriginYToises=600
elif [[ "$PlancheNumero" == "53" ]]
then
OriginXToises=200
OriginYToises=600
elif [[ "$PlancheNumero" == "54" ]]
then
OriginXToises=800
OriginYToises=600
elif [[ "$PlancheNumero" == "55" ]]
then
OriginXToises=1400
OriginYToises=600
elif [[ "$PlancheNumero" == "56" ]]
then
OriginXToises=2000
OriginYToises=600
elif [[ "$PlancheNumero" == "57" ]]
then
OriginXToises=-2000
OriginYToises=200
elif [[ "$PlancheNumero" == "58" ]]
then
OriginXToises=-1600
OriginYToises=200
elif [[ "$PlancheNumero" == "59" ]]
then
OriginXToises=-1000
OriginYToises=200
elif [[ "$PlancheNumero" == "60" ]]
then
OriginXToises=-400
OriginYToises=200
elif [[ "$PlancheNumero" == "61" ]]
then
OriginXToises=200
OriginYToises=200
elif [[ "$PlancheNumero" == "62" ]]
then
OriginXToises=800
OriginYToises=200
elif [[ "$PlancheNumero" == "63" ]]
then
OriginXToises=1400
OriginYToises=200
elif [[ "$PlancheNumero" == "64" ]]
then
OriginXToises=2000
OriginYToises=200
elif [[ "$PlancheNumero" == "65" ]]
then
OriginXToises=-2000
OriginYToises=-200
elif [[ "$PlancheNumero" == "66" ]]
then
OriginXToises=-1600
OriginYToises=-200
elif [[ "$PlancheNumero" == "67" ]]
then
OriginXToises=-1000
OriginYToises=-200
elif [[ "$PlancheNumero" == "68" ]]
then
OriginXToises=-400
OriginYToises=-200
elif [[ "$PlancheNumero" == "69" ]]
then
OriginXToises=200
OriginYToises=-200
elif [[ "$PlancheNumero" == "70" ]]
then
OriginXToises=800
OriginYToises=-200
elif [[ "$PlancheNumero" == "71" ]]
then
OriginXToises=1400
OriginYToises=-200
elif [[ "$PlancheNumero" == "72" ]]
then
OriginXToises=2000
OriginYToises=-200
fi
if [[ "OriginYToises" -gt "1" ]]
then
NordSud=NORD
else
NordSud=SUD
fi
if [[ "OriginXToises" -gt "1" ]]
then
EstOuest=$(echo "l'EST" )
else
EstOuest=$(echo "l'OUEST" )
fi

OrigineMetresX=$(echo $OriginXToises*1.94903631+$ObsPilierGeodesiqueLong|bc -l)
OrigineMetresY=$(echo $OriginYToises*1.94903631+$ObsPilierGeodesiqueLat|bc -l)
Est=$(echo $OrigineMetresX+$Largeur|bc -l)
Sud=$(echo $OrigineMetresY-$Hauteur|bc -l)
echo "${white}---> Origine en X (Toises)        ${orange}$OriginXToises Toises à "$EstOuest" du Pilier Géodésique de l'Observatoire de Paris"
echo "${white}---> Origine en Y (Toises)        ${orange}$OriginYToises Toises au "$NordSud" du Pilier Géodésique de l'Observatoire de Paris"
echo "${white}---> \$ObsPilierGeodesiqueLat      ${green}$ObsPilierGeodesiqueLat"
echo "${white}---> \$ObsPilierGeodesiqueLong     ${green}$ObsPilierGeodesiqueLong"
echo "${white}---> \$OrigineMetresX              ${orange}$OrigineMetresX mètres à "$EstOuest" du Pilier Géodésique de l'Observatoire de Paris"
echo "${white}---> \$OrigineMetresY              ${orange}$OrigineMetresY mètres au "$NordSud" du Pilier Géodésique de l'Observatoire de Paris"
echo "${white}---> \$Est                         ${orange}$Est"
echo "${white}---> \$Sud                         ${orange}$Sud${reset}"
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 "$OrigineMetresX" "$OrigineMetresY" -gcp 0 "$HeightImage" "$OrigineMetresX" "$Sud" -gcp "$WidthImage" 0 "$Est" "$OrigineMetresY" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$planche" temp.tif

if [ -f "../_Output/"$SimpleName".tif" ]
then
mv "../_Output/"$SimpleName".tif" ../_TRASH_TEMP/"$FileDate"_"$SimpleName".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$SimpleName".tif"
done
if [ -f temp.tif ]
then
mv temp.tif ../_TRASH_TEMP/"$FileDate"_temp.tif
fi
cd - 2>&1 &>/dev/null
