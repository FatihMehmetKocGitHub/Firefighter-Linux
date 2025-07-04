import requests
import json
from datetime import datetime

# Uşak'ın yaklaşık koordinatları
LATITUDE = 38.68
LONGITUDE = 29.40

# Open-Meteo API'sinden önümüzdeki 24 saat için veri istiyoruz
# temperature_2m: Sıcaklık
# relative_humidity_2m: Bağıl Nem
# wind_speed_10m: Rüzgar Hızı
URL = f"https://api.open-meteo.com/v1/forecast?latitude={LATITUDE}&longitude={LONGITUDE}&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m&forecast_days=1"

print(f"Hava durumu verileri Uşak için çekiliyor...")
print(f"Kullanılan API adresi: {URL}")

try:
    # API'ye internet üzerinden istek gönder
    response = requests.get(URL)
    response.raise_for_status()  # Bir hata olursa (404, 500 gibi) program duracak

    # Gelen JSON formatındaki veriyi Python'un anlayacağı bir formata çevir
    data = response.json()
    hourly_data = data['hourly']

    print("\n--- Uşak İçin Önümüzdeki 24 Saatlik Hava Durumu Tahmini ---")

    # Gelen veriyi saat saat işleyip ekrana yazdır
    for i in range(len(hourly_data['time'])):
        time = datetime.fromisoformat(hourly_data['time'][i])
        temp = hourly_data['temperature_2m'][i]
        humidity = hourly_data['relative_humidity_2m'][i]
        wind = hourly_data['wind_speed_10m'][i]

        # Basit bir risk analizi: Sıcaklık > 30, Nem < 40, Rüzgar > 15 ise tehlikeli!
        risk_notu = ""
        if temp > 30 and humidity < 40 and wind > 15:
            risk_notu = "  <--- YÜKSEK RİSK!"

        print(f"Saat: {time.strftime('%H:%M')} | Sıcaklık: {temp}°C | Nem: %{humidity} | Rüzgar: {wind} km/s {risk_notu}")

    print("\nVeri çekme ve işleme başarıyla tamamlandı.")

except requests.exceptions.RequestException as e:
    print(f"HATA: Hava durumu API'sine bağlanılamadı. İnternet bağlantınızı kontrol edin. Detay: {e}")
except KeyError:
    print("HATA: API'den gelen verinin formatı değişmiş olabilir, anahtar bulunamadı.")