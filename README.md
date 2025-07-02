# firefighter-linux-osint: Bir GEO-OSINT Analiz Platformu

![Firefighter-Linux Logo](./assets/logo.png)

## Proje Misyonu
Sorgulanamaz dijital kanıtlar üreten, açık ve kapalı kaynakları birleştiren, yapay zeka ile zenginleştirilmiş, küresel ölçekte etki yaratacak istihbarat raporları sunan, bağımsız ve dağıtılabilir bir **GEO-OSINT (Coğrafi Açık Kaynak İstihbaratı)** analiz platformu inşa etmek.

## Temel Felsefe
* **Kanıt Odaklı:** Her analiz, doğrulanabilir ve bütünlüğü korunmuş (hash, metadata) dijital kanıtlara dayanır.
* **Açık Kaynak Çekirdek:** Platformun temeli, şeffaflık ve topluluk katılımı için tamamen açık kaynaklı teknolojiler üzerine kurulmuştur.
* **Modüler Mimari:** Sistem, tek bir analistin iş istasyonundan, sürekli veri toplayan, analiz eden ve raporlayan dağıtık bir mimariye dönüşebilecek şekilde tasarlanmıştır.
* **Tekrarlanabilirlik:** `install_v1.0.sh` gibi betikler ve Docker gibi araçlar sayesinde tüm sistemin kurulumu ve dağıtımı tekrarlanabilir ve otomatiktir.

## Depo Yapısı
Proje, görev ayrımı prensibiyle iki ana depoda yönetilmektedir:
* `Firefighter-Linux` (Bu Depo - Public): Projenin felsefesi, genel dokümantasyonu, kurulum betikleri (`install_v1.0.sh`) gibi halka açık tüm belgeleri içerir.
* `firefighter-linux-osint` (Özel Depo - Private): API anahtarları, `docker-compose.yml` dosyaları, hassas yapılandırmalar, toplanan veriler ve analiz sonuçları gibi özel ve hassas bilgileri barındırır.

## Teknolojik Yol Haritası

Bu yol haritası, platformun adım adım nasıl geliştirileceğini tanımlar.

### **v1.0: Analist İstasyonu (Mevcut Sürüm)**
* **Hedef:** Analiste, veriyi görselleştirip derinlemesine analiz edebileceği profesyonel araçlar sunan tam teşekküllü bir iş istasyonu.
* **Teknolojiler:** Ubuntu 22.04 LTS, XFCE4, Docker, **QGIS**, **Google Earth Pro**, **Maltego**, **SpiderFoot**, GDAL, ExifTool.

### **v2.0: Otomatik Veri Toplayıcı (Collector)**
* **Hedef:** Tekrarlayan veri toplama görevlerini (uydu görüntüsü indirme, harita verisi güncelleme vb.) 7/24 otomatikleştirmek.
* **Teknolojiler:** Python (`requests`, `sentinelhub-py`), Node-RED, `cron`.

### **v3.0: Merkezi Platform (Platform)**
* **Hedef:** Toplanan tüm coğrafi ve ilişkisel veriyi, sorgulanabilir, ölçeklenebilir ve yüksek performanslı merkezi bir veritabanına taşımak.
* **Teknolojiler:** PostgreSQL + **PostGIS**, `pg_tileserv`, FastAPI.

### **v4.0: Yapay Zeka Motoru (AI)**
* **Hedef:** Platforma "görme" ve "anlama" yeteneği kazandırarak insan gözünün kaçırabileceği desenleri ve nesneleri (gemi, uçak, bina vb.) otomatik olarak tespit etmek.
* **Teknolojiler:** PyTorch, TensorFlow, **YOLOv8**, Label Studio.

### **v5.0: Küresel Raporlama Motoru (Global)**
* **Hedef:** Üretilen istihbaratı, sorgulanamaz, dinamik ve interaktif (3D haritalar, zaman atlamalı videolar) profesyonel raporlara dönüştürmek.
* **Teknolojiler:** Quarto, **CesiumJS**, Streamlit, `ffmpeg`.

---

## Katkıda Bulunma

Bu bir açık kaynak çabasıdır. Projenin felsefesine, dokümantasyonuna ve kurulum betiklerine katkıda bulunmak isterseniz "Pull Request" açmaktan çekinmeyin.

## Lisans

Bu proje MIT Lisansı altında lisanslanmıştır.
