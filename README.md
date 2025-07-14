# Firefighter Linux V1.1

![Firefighter-Linux Logo](./assets/trlogo.jpeg)

## Yangın Gözlem ve Coğrafi Bilgi Sistemi

---

## 🔹 Genel Tanım

Firefighter Linux, orman yangınlarına müdahale eden ekipler ve kriz yönetim birimleri için geliştirilmiş, hazır kurulu bir **coğrafi bilgi analiz sistemidir**.  
Uydu görüntüleri, açık kaynak veriler ve manuel analiz yöntemleriyle sahadaki durumu hızlıca anlamayı ve belgelemeyi amaçlar.

---

## 🔹 Sistem Mimarisi

- **Dağıtım Formatı:** `.ova` (VirtualBox uyumlu sanal makine)  
- **Kurulum Yapısı:** Native – Docker kullanılmaz, tüm yazılımlar kurulu gelir  
- **Temel Sistem:** Xubuntu 22.04 LTS (XFCE masaüstü)

---

## 🔹 Kullanıcı Profili

- Kriz masası ve afet yönetim ekipleri  
- Coğrafi Bilgi Sistemleri (CBS) uzmanları  
- Açık kaynak veri analistleri  
- Akademisyenler ve gönüllü araştırmacılar

---

## 🔹 Kurulu Uygulamalar

### Uydu ve Harita Analizi
- **QGIS** – Raster, vektör ve konumsal veri işleme  
- **ESA SNAP** – Sentinel verisi analizi  
- **Google Earth Pro** – Uydu karşılaştırması ve görselleştirme  
- **GDAL** – Veri dönüşümü (GeoTIFF, KML vs.)  
- **MapTiler Desktop (opsiyonel)** – Offline harita üretimi  

### Web Tabanlı Uydu Kaynakları
- NASA FIRMS  
- Sentinel EO Browser  
- Zoom Earth  
- Copernicus Browser  
- OpenStreetMap  
- NASA Worldview  

> Tüm kaynaklara masaüstü üzerinden `.desktop` kısayollarıyla erişim sağlanır.

### OSINT ve Görsel Analiz Araçları
- Obsidian – Bilgi günlüğü  
- Flameshot – Görsel işaretleme  
- LibreOffice – PDF üretimi  
- Geany / VSCode – Kod ve not düzenleme  
- SpiderFoot – Açık kaynak analiz  
- Maltego CE – Varlık görselleştirme  
- snscrape – Sosyal medya tarayıcı  
- ExifTool – Görsel metadata çözümleme  
- Whois / GeoIP – Alan adı/IP çözümleme

---

## 🔹 Klasör Yapısı

Belgeler/
├── Raporlar/
├── Kanitlar/
├── Ekran_Goruntuleri/
├── Veriler/ (GeoTIFF, KML, Sentinel .SAFE)

scripts/
firms_output/
kml_output/
landsat_output/


---

## 🔹 Kullanım Senaryosu

- **İlk Tespit:** Sosyal medya üzerinden yangın sinyali tarama (`snscrape`)  
- **Görsel Analiz:** FIRMS ve Zoom Earth ile duman/sıcak nokta takibi  
- **Mekansal Analiz:** QGIS ile yangın alanı belirleme  
- **Raporlama:** Flameshot + Obsidian + LibreOffice ile PDF üretimi

---

## 🔹 V1.1 – Yeni Özellikler (Temmuz 2025)

Firefighter Linux V1.1, ilk sürümün üzerine geliştirilen ve veri işleme/görselleştirme gücünü artıran kararlı bir güncellemedir.

### 1. FIRMS API Entegrasyonu (Otomatik Veri Çekimi)
- NASA FIRMS API üzerinden Türkiye'deki aktif yangın verileri alınır  
- Veriler `.csv` formatında il bazında kaydedilir  

### 2. Çoklu Bölge Destekli Sorgulama
- 81 ili kapsayan `LOCATIONS` sözlüğü ile otomatik analiz  
- Son 10 güne kadar olan veriler alınabilir

### 3. KML Çıktı Üretimi
- Yangın konumları `.kml` dosyasına aktarılır  
- Google Earth Pro üzerinde doğrudan açılabilir

### 4. Landsat Tabanlı Risk Haritası
- NDVI ve LST değerlerinden **yangın riski haritası** üretilir  
- `super overlay` şeklinde Google Earth ile görselleştirilir

### 5. Güncellenmiş Dosya ve Script Yapısı
- Scriptler sadeleştirildi, klasör yapısı netleştirildi  
- Manuel adım adım çalıştırılabilir

### 6. İyileştirilmiş Masaüstü Ortamı
- Masaüstü kısayolları ile uydu kaynaklarına anında erişim  
- Kullanıcı arayüzü sadeleştirildi

---

## 🔹 Veri Güncelliği Hakkında

Bu sistemde kullanılan veriler, NASA, Copernicus ve Landsat gibi kaynakların sunduğu açık uydu sistemlerinden çekilmektedir.  
Veriler genellikle **yakın geçmişe (son 3–24 saat)** aittir ve **gerçek zamanlı değildir.**  
Bu nedenle sistem, anlık müdahale değil; **durumsal analiz, risk değerlendirmesi ve olay sonrası raporlama** amacıyla kullanılmalıdır.

---

## 🔹 V1.1 Çıktıları

- `.ova` sanal makine dosyası  
- İl bazlı `.csv` ve `.kml` çıktıları  
- NDVI ve LST tabanlı `.tif` dosyaları  
- Python betikleri (`scripts/`)  
- SHA512 imzalı dosya doğrulama desteği  

---
🔹 Büyük Veri Dosyaları (GeoTIFF, KML, CSV vb.)

Bu proje kapsamında .tif, .kml, .csv, .json gibi büyük dosyalar versiyon kontrolüne dahil edilmemiştir. Bu dosyalar hem depolama hem de paylaşım kolaylığı açısından GitHub yerine Google Drive üzerinden paylaşılmaktadır.
📂 İndirilebilir Veri Arşivi

Tüm örnek veri dosyalarına aşağıdaki klasörden ulaşabilirsiniz:

🔗 Google Drive Klasörü – Firefighter Linux Verileri
((https://drive.google.com/drive/folders/1pamhIkdkVh2AI4iR49OgmPfqqWUmeadp))

    📌 Bu klasörde:

        FIRMS yangın verisi .csv dosyaları

        .kml çıktı dosyaları

        Landsat tabanlı NDVI / LST .tif dosyaları

        JSON/GeoJSON örnek analiz çıktıları
        yer alır.

⚠️ Notlar

    Bu veriler test amaçlıdır, sürekli güncellenmeyebilir.

    Sistemi çalıştırmadan önce klasörlere bu verileri manuel olarak indirip yerleştirmeniz gerekebilir (örnek: csv/, kml_output/, risk_map_output/).

    .gitignore ile bu klasörler GitHub'a dahil edilmez.
## 🔹 Felsefe ve Yaklaşım

Firefighter Linux, manuel uydu destekli analiz sistemidir.  
Amaç; kriz anlarında açık veriye dayalı, yerli ve sade bir çözüm sunarak hızlı karar alımına destek olmaktır.  
Veriler görsel ve mekansal analizle işlenir, belgelenir ve paylaşılır.

> V1, dijital bir kriz analiz masasının temelini oluşturur.  
> V2: otomasyon  
> V3: yapay zeka destekli analiz hedeflenmektedir.

---

## 🔹 Geliştirici

**Fatih Mehmet Koç**  
İtfaiyeci / Yazılım Geliştirici  
LinkedIn: [linkedin.com/in/fatihmehmetkoc](https://www.linkedin.com/in/fatihmehmetkoc)

---
