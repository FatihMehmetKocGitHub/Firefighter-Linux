Firefighter Linux V1

![Firefighter-Linux Logo](./assets/logo.png)

Yangın Gözlem ve Coğrafi İstihbarat Sistemi
Genel Tanım

Firefighter Linux V1, orman yangınlarına müdahale eden ekipler ve kriz yönetim birimleri için özel olarak geliştirilmiş, hazır kurulu bir coğrafi istihbarat analiz sistemidir. Uydu görüntüleri, açık kaynak veriler ve manuel analiz yöntemleriyle sahadaki durumu hızlıca anlamayı ve belgelemeyi sağlar.
Sistem Mimarisi

    Dağıtım Formatı: .ova (VirtualBox uyumlu sanal makine)

    Kurulum Yapısı: Native (Docker kullanılmaz; tüm yazılımlar kurulu gelir)

    Temel Sistem: Xubuntu 22.04 LTS (XFCE masaüstü)

Kullanıcı Profili

    Kriz masası ekipleri

    Coğrafi Bilgi Sistemleri (CBS) uzmanları

    OSINT araştırmacıları

    Akademisyenler ve gönüllü analistler

Kurulu Uygulamalar
Uydu ve Harita Analizi

    QGIS: Raster, vektör ve coğrafi veri analizi

    ESA SNAP: Sentinel uydu görüntülerinin işlenmesi

    Google Earth Pro: Zaman serisi karşılaştırma ve yüksek çözünürlüklü uydu görüntüleme

    MapTiler Desktop (Opsiyonel): Offline harita üretimi

    GDAL: Veri formatı dönüştürme ve raster işlemleri

Web Tabanlı Uydu Kaynakları

    NASA FIRMS: Sıcak nokta verisi

    Zoom Earth: Gerçek zamanlı görsel izleme

    Sentinel EO Browser: Uydu zaman serisi analiz

    OpenStreetMap: Harita altlığı

    NASA Worldview ve Copernicus Browser: MODIS, Sentinel, Landsat görüntüleri

Masaüstü üzerinden bu kaynaklara doğrudan erişim için .desktop kısayolları sağlanır.
OSINT ve Analiz Araçları

    Obsidian: Olay günlüğü ve bilgi kaydı (Markdown tabanlı)

    Flameshot: Ekran görüntüsü alma ve işaretleme

    LibreOffice: PDF ve belge üretimi

    Geany / VSCode: Not ve kod düzenleme

    SpiderFoot: Otomatik OSINT tarama

    Maltego CE: Varlık ilişkisi haritalama

    snscrape: Sosyal medyada yangın sinyallerini tarama

    ExifTool: Görsel metadata analizi

    Whois / GeoIP: Alan adı ve IP konum çözümlemesi

Standart Klasör Yapısı

    Belgeler/Raporlar: PDF ve Markdown raporlar

    Belgeler/Kanitlar: Notlar, ekran görüntüleri ve belgeler

    Belgeler/Ekran_Goruntuleri: Flameshot ile alınan işaretli görseller

    Belgeler/Veriler: GeoTIFF, KML ve Sentinel .SAFE uydu verileri

Kullanım Senaryosu

    İlk Tespit: Sosyal medya taraması (snscrape), kanıt kaydı (Obsidian)

    Görsel Analiz: FIRMS ve Zoom Earth kullanarak sıcak nokta ve duman takibi

    Mekansal Analiz: QGIS ile yangın sınırlarını çizme, tehlike altındaki yerleşimleri belirleme

    Raporlama: Flameshot ile ekran görüntüsü alma, Obsidian’a ekleme, PDF rapor oluşturma

Firefighter Linux V1 Çıktıları

    Kurulu .ova sanal makinesi

    Günlük yangın raporu şablonları

    Web kısayolları

    Test verileri (KML, GeoTIFF, JSON)

    SHA512 doğrulama desteği

Felsefe ve Yaklaşım

Firefighter Linux V1, manuel olarak kullanılmak üzere tasarlanmış bir analiz platformudur. Uydu görüntüsü, sosyal medya sinyali ve açık kaynak bilgilerden elde edilen veriler, sahada karar vericilere kanıta dayalı ve hızlı istihbarat sağlamak amacıyla işlenir.

V1, bir dijital savaş odasının temelini oluşturur: Uydu verisini, sosyal medya OSINT araçlarını ve yerel analiz uygulamalarını tek bir çatı altında sunar.


Firefighter Linux V2
Otomatik Uydu Verisi Toplama ve Yangın Riski Analizi Sistemi

Firefighter Linux V2, yangın riskinin önceden tespiti için geliştirilen yarı-otomatik veri toplama ve analiz motorudur. Manuel V1’in devamı niteliğinde olan bu aşama, uydu verilerini ve meteorolojik kaynakları düzenli aralıklarla indirip işleyen Python betikleriyle çalışır. Amaç, yangın çıkmadan önce riskli bölgeleri tespit edebilecek bir erken uyarı sistemi kurmaktır.
V2'nin Ana Hedefleri

    Uydu Verilerinin Otomatik Toplanması:

        Sentinel-2 (bitki örtüsü sağlığı – NDVI)

        Landsat 8/9 (termal bant – yüzey sıcaklığı)

        Open-Meteo API (sıcaklık, rüzgar, nem)

        Python kütüphaneleri: sentinelsat, requests, datetime, pandas

    Veri İşleme ve İndeks Üretimi:

        Rasterio + NumPy ile:

            NDVI (kuruluk haritası)

            LST (yüzey sıcaklığı haritası)

            Normalize edilmiş risk skorları

    Yangın Riski Modellemesi:

        Weighted Overlay modeli (her katmana ağırlık verilerek analiz)

        Python ile otomatik raster analiz

        CSV formatında çıktı üretimi ve görsel risk haritası

    Raporlama ve Otomasyon:

        Otomatik olarak risk haritası PNG/PDF oluşturma

        E-posta bildirimi ya da manuel kontrol paneline kayıt

        Cronjob ile her gün veya her hafta otomatik çalıştırma

        Sonuçların risk_map_output/ klasörüne kaydedilmesi
