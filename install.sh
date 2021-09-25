#!/data/data/com.termux/files/usr/bin/bash
apt-get update
apt-get  --assume-yes upgrade
apt-get  --assume-yes install coreutils gnupg wget
if [ ! -f "$PREFIX/etc/apt/sources.list.d/rendiix.list" ]; then
  mkdir -p $PREFIX/etc/apt/sources.list.d
  echo -e "deb https://rendiix.github.io android-tools termux" > $PREFIX/etc/apt/sources.list.d/rendiix.list 
  wget -qP $PREFIX/etc/apt/trusted.gpg.d https://rendiix.github.io/rendiix.gpg 
  apt update
  apt install platform-tools
else 
  echo "Repo already installed"
  apt install platform-tools
fi

echo "done!"
