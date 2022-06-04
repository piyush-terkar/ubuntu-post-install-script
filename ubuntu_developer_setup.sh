#!/usr/bin/bash

sudo -v
BLUE="\033[1;96m"
GREEN="\033[1;92m"
YELLOW="\033[1;93m"
LIGHTB="\033[1;94m"
RED="\033[1;91m"
ENDCOLOR="\033[0m"

read -p "Enter your username (the user for which you want to install): " cuser


echo -e "${YELLOW}----------------------------------------- OPTIMISING SYSTEM FOR EFFICIENT PERFORMANCE -----------------------------------------${ENDCOLOR}"
echo -e "${BLUE} INSTALLING APT-FAST ${ENDCOLOR}"
add-apt-repository ppa:apt-fast/stable -y
apt-get update
apt-get install apt-fast -y
sudo -u $cuser echo "alias apt='apt-fast'" >> ~/.bashrc
sudo -u $cuser source .bashrc
echo -e "${GREEN} INSTALLED APT-FAST ${ENDCOLOR}"
sudo -v
echo -e "${BLUE} PERFORMING FRESH BOOT UPGRADE ${ENDCOLOR}"
apt update && apt upgrade -y && apt autoremove -y
echo -e "${GREEN} UPGRADE COMPLETE ${ENDCOLOR}"
sudo -v

echo -e "${BLUE} INSTALLING TLP AND THERMALD ${ENDCOLOR}"
add-apt-repository ppa:linrunner/tlp -y
apt update
apt install tlp tlp-rdw -y
apt install thermald -y
echo -e "${GREEN} INSTALLED TLP AND THERMALD ${ENDCOLOR}"
sudo -v

echo -e "${BLUE} INSTALLING PRELOAD ${ENDCOLOR}"
apt install preload -y
echo -e "${GREEN} INSTALLED PRELOAD ${ENDCOLOR}"
sudo -v

echo -e "${YELLOW}----------------------------------------- INSTALLING BASIC PROGRAMMING LANGUAGES -----------------------------------------${ENDCOLOR}"
echo -e "${BLUE} INSTALLING G++ AND GCC ${ENDCOLOR}"
apt install gcc -y
apt install g++ -y
echo -e "${GREEN} INSTALLed G++ AND GCC ${ENDCOLOR}"
sudo -v

echo -e "${BLUE} INSTALLING JAVA ${ENDCOLOR}"
apt install default-jdk -y
echo -e "${GREEN} INSTALLED JAVA ${ENDCOLOR}"
sudo -v

echo -e "${BLUE} INSTALLING PYTHON ${ENDCOLOR}"
apt install python -y
apt install python3 -y
echo -e "${GREEN} INSTALLED PYTHON ${ENDCOLOR}"
sudo -v

echo -e "${BLUE} INSTALLING PIP ${ENDCOLOR}"
apt install python-pip -y
apt install python3-pip -y
echo -e "${GREEN} INSTALLED PIP ${ENDCOLOR}"
sudo -v

echo -e "${YELLOW}----------------------------------------- INSTALLING TECH STACKS FOR DIFFERENT DOMAINS -----------------------------------------"
sudo -v

read -p "INSTALL WEB-DEVELOPMENT STACK (MERN) Continue? (Y/N): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]
then
echo -e "${BLUE} INSTALLING NODE ${ENDCOLOR}"
apt install nodejs -y
node -v
echo -e "${GREEN} INSTALLED NODE ${ENDCOLOR}"
echo -e "${BLUE} INSTALLING NPM ${ENDCOLOR}"
apt install npm -y
npm -v
echo -e "${GREEN} INSTALLED NPM ${ENDCOLOR}"
echo -e "${BLUE} INSTALLING NODEMON ${ENDCOLOR}"
npm -g i nodemon
echo -e "${GREEN} INSTALLED NODEMON ${ENDCOLOR}"
echo -e "${BLUE} INSTALLING MONGODB ${ENDCOLOR}"
apt install mongodb
systemctl enable mongodb
systemctl status mongodb
echo -e "${GREEN} INSTALLED MONGODB ${ENDCOLOR}"
echo -e "${GREEN} INSTALLED WEB-DEVELOPMENT STACK (MERN) ${ENDCOLOR}"
fi
sudo -v

read -p "INSTALL DATA-SCIENCE STACK Continue? (Y/N): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]
then
echo -e "${BLUE} INSTALLING NUMPY ${ENDCOLOR}"
sudo -u $cuser pip3 install numpy
echo -e "${GREEN} INSTALLED PYTHON ${ENDCOLOR}"
echo -e "${BLUE} INSTALLING PANDAS ${ENDCOLOR}"
sudo -u $cuser pip3 install pandas
echo -e "${GREEN} INSTALLED PANDAS ${ENDCOLOR}"
echo -e "${BLUE} INSTALLING SCI-KIT LEARN (SKLEARN) ${ENDCOLOR}"
sudo -u $cuser pip3 install -U scikit-learn
sudo -v

echo -e "${GREEN} INSTALLED SCI-KIT LEARN ${ENDCOLOR}"
echo -e "${BLUE} INSTALLING MATPLOTLIB ${ENDCOLOR}"
sudo -u $cuser pip3 install matplotlib
sudo -v

echo -e "${GREEN} INSTALLED MATPLOTLIB ${ENDCOLOR}"
echo -e "${BLUE} INSTALLING SEABORN ${ENDCOLOR}"
sudo -u $cuser pip3 install seaborn
sudo -v

echo -e "${GREEN} INSTALLED SEABORN ${ENDCOLOR}"
echo -e "${GREEN} INSTALLED DATA-SCIENCE STACK ${ENDCOLOR}"
fi

echo -e "${YELLOW}----------------------------------------- INSTALLING AND CONFIGURING BASIC DEVELOPMENT TOOLS AND SETTINGS -----------------------------------------"
echo -e "${BLUE} INSTALLING GOOGLE CHROME ${ENDCOLOR}"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
apt install google-chrome-stable
echo -e "${GREEN} INSTALLED GOOGLE CHROME ${ENDCOLOR}"
sudo -v

echo -e "${BLUE} INSTALLING GIT ${ENDCOLOR}"
apt install git
git --version
echo -e "${LIGHTB} ENTER YOUR GIT USERNAME (firstname lastname): ${ENDCOLOR}"
read username
sudo -u $cuser git config --global user.name "$username"
echo -e "${LIGHTB} ENTER YOUR GIT EMAIL: ${ENDCOLOR}"
read email
sudo -u $cuser git config --global user.email "$email"
echo -e "${BLUE} Generating ssh key ${ENDCOLOR}"
sudo -u $cuser ssh-keygen -t ed25519 -C "$email"
cat ~/.ssh/id_ed25519.pub
echo -e "${BLUE} COPY ABOVE KEY TO YOUR GIT-HUB ACCOUNT TO COMPLETE THE CONFIGURATION ${ENDCOLOR}"
echo -e "${BLUE} VISIT (ctrl + click to follow the link): ${ENDCOLOR} ${LIGHTB} https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account"
sudo -u $cuser google-chrome https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
while :; do
read -p "HAVE YOU COPIED THE KEY? (Y/N): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]
then
break;
else
echo -e "${RED} DO NOT SKIP THIS STEP ADD THE KEY TO YOUR ACCOUNT!!"
sudo -v

fi
done
echo -e "${BLUE} INSTALLED AND CONFIGURED GIT${ENDCOLOR}"
echo -e "${BLUE} ADDING UNIVERSAL CODECS${ENDCOLOR}"
add-apt-repository multiverse -y
apt update
sudo -v

apt install ubuntu-restricted-extras
echo -e "${GREEN} ADDED UNIVERSAL CODECS ${ENDCOLOR}"
echo -e "${BLUE} INSTALLING VLC MEDIA PLAYER ${ENDCOLOR}"
snap install vlc -y
sudo -v

echo -e "${GREEN} INSTALLED VLC MEDIA PLAYER ${ENDCOLOR}"
echo -e "${BLUE} INSTALLING VISUAL STUDIO CODE ${ENDCOLOR}"
snap install code --classic -y
sudo -v

echo -e "${GREEN} INSTALLED VISUAL STUDIO CODE ${ENDCOLOR}"

echo -e "${YELLOW}----------------------------------------- INSTALLING DATABASES -----------------------------------------"
echo -e "${BLUE} INSTALLING MYSQL ${ENDCOLOR}"
apt install mysql-server
sudo -v

systemctl enable mysql-server
systemctl status mysql
echo -e "${GREEN} INSTALLED MYSQL ${ENDCOLOR}"

echo -e "${YELLOW}----------------------------------------- FINISHING UP -----------------------------------------"
echo -e "${BLUE} CHECKING FOR FINAL UPGRADES IF ANY ${ENDCOLOR}"
apt update && apt upgrade -y && apt autoremove -y
echo -e "${RED} IT IS RECOMMENDED TO REBOOT THE SYSTEM AFTER SO MANY CONFIGURATIONS AND INSTALLS REBOOT NOW? (Y/N): "
read confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]
then
reboot
else
echo -e "${GREEN} SETUP COMPLETE ${ENDCOLOR}"
fi