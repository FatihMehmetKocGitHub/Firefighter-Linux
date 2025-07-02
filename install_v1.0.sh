#!/bin/bash
# firefighter-linux-osint v2.0 (Analyst) Kurulum Betiği
# Bu betik, temiz bir Ubuntu 22.04 LTS (XFCE) sistemi üzerine 
# gerekli tüm OSINT araçlarını kurar.

echo "=================================================="
echo "      ARGUS Core v1.0 Bileşenleri Kuruluyor...    "
echo "=================================================="

# Sistem paketlerini güncelle
sudo apt-get update

# Temel araçlar ve kütüphaneler
sudo apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    curl \
    jq \
    htop \
    nano \
    gdal-bin \
    python3-gdal \
    exiftool

echo "=================================================="
echo "          Docker Altyapısı Kuruluyor...           "
echo "=================================================="

# Docker için gerekli paketler
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Docker GPG anahtarını ekle
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Docker deposunu ekle
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Docker Engine ve Compose'u kur
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "Docker kurulumu tamamlandı. Başlangıçta çalışması için etkinleştirilecek."
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo "=================================================="
echo "     ARGUS Analyst v2.0 Bileşenleri Kuruluyor...  "
echo "=================================================="

# QGIS Kurulumu
sudo apt-get install -y qgis python3-qgis

# Google Earth Pro Kurulumu
echo "Google Earth Pro indiriliyor ve kuruluyor..."
wget -q https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb
sudo dpkg -i google-earth-pro-stable_current_amd64.deb
sudo apt-get install -f -y # Gerekli bağımlılıkları tamamlar
rm google-earth-pro-stable_current_amd64.deb

# Web Kazıma ve Otomasyon Araçları (Selenium/Geckodriver)
sudo apt-get install -y firefox-geckodriver
pip3 install selenium

# SpiderFoot Kurulumu (Kullanıcının ev dizinindeki Projects klasörüne)
echo "SpiderFoot '~/Projects/spiderfoot' içerisine klonlanıyor..."
mkdir -p ~/Projects
cd ~/Projects
git clone https://github.com/smicallef/spiderfoot.git
cd spiderfoot
pip3 install -r requirements.txt
cd ~/Firefighter-Linux # Betiğin çalıştığı yere geri dön

# Manuel Kurulum Notları
echo "=================================================="
echo "                 ÖNEMLİ NOTLAR                  "
echo "=================================================="
echo "Maltego Community Edition, www.maltego.com/downloads adresinden manuel olarak indirilip .deb paketi kurulmalıdır."
echo "Kurulum tamamlandı! Lütfen terminali yeniden başlatarak Docker'ın yetkilerini aktif edin."

