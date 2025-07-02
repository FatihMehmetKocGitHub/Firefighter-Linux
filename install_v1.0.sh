#!/bin/bash
# firefighter-linux-osint v1.0 Kurulum Betiği
# Bu betik, temiz bir Ubuntu 22.04 LTS (XFCE) sistemi üzerine 
# firefighter-linux için gerekli tüm OSINT araçlarını kurar.

echo "=================================================="
echo "  firefighter-linux Core v1.0 Bileşenleri Kuruluyor...    "
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
echo "  firefighter-linux Analyst v1.0 Bileşenleri Kuruluyor...  "
echo "=================================================="

# QGIS Kurulumu
sudo apt-get install -y qgis python3-qgis

# Google Earth Pro Kurulumu
echo "Google Earth Pro indiriliyor ve kuruluyor..."
wget -q https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb
sudo dpkg -i google-earth-pro-stable_current_amd64.deb
sudo apt-get install -f -y # Gerekli bağımlılıkları tamamlar
rm google-earth-pro-stable_current_amd64.deb

# Maltego Kurulumu
echo "Maltego Community Edition kuruluyor..."
# ÖNEMLİ: Bu komutun çalışması için, Maltego'nun .deb dosyasının
# '/home/KULLANICI_ADINIZ/Downloads' klasöründe olması gerekir.
# 'apt install' komutu, 'dpkg -i' komutuna göre daha iyidir çünkü
# eksik bağımlılıkları (dependencies) otomatik olarak bulur ve kurar.
sudo apt install -y ~/Downloads/Maltego.v*.deb

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

# Kurulum Sonrası Notlar
echo "=================================================="
echo "                 ÖNEMLİ NOTLAR                  "
echo "=================================================="
echo "Kurulum tamamlandı! Docker yetkileri için terminali yeniden başlatmanız gerekebilir."
echo ""
echo "--- Önerilen Firefox Web Eklentileri ---"
echo "Aşağıdaki eklentiler, OSINT çalışmalarınız için şiddetle tavsiye edilir."
echo "Cubic ile ISO oluştururken masaüstüne bu eklentileri kuran bir betik ekleyeceğiz."
echo ""
echo "  - Wappalyzer: Ziyaret edilen sitelerin teknolojilerini (sunucu, framework vb.) gösterir."
echo "  - User-Agent Switcher: Tarayıcınızın kimliğini (Chrome, mobil cihaz vb.) değiştirmenizi sağlar."
echo "  - FoxyProxy Standard: Proxy sunucuları arasında kolayca geçiş yapmanızı sağlar."
echo "  - uBlock Origin: Reklamları ve takipçileri engelleyerek güvenliği ve hızı artırır."
echo "  - Privacy Badger: Görünmez takipçileri otomatik olarak engeller."
echo "  - SingleFile: Web sayfalarını tüm içeriğiyle tek bir HTML dosyası olarak kaydeder."
echo "  - Google Search by Image: Bir resme sağ tıklayarak Google'da benzerlerini aramanızı sağlar."
echo "=================================================="

