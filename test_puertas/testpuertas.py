import requests
import time
import random

# URL de tu servidor (igual que en tu ESP32)
URL = "http://192.168.0.100:3000/validar-tarjeta"

# Lista de tarjetas para simular
tarjetas = ["12583029", "22222222"]

# Lista de puertas para simular
puertas = [1, 2, 3, 4, 5]  # IDs según tu tabla 'puertas'

print("Simulando ESP32 enviando tarjetas al servidor... (Ctrl+C para detener)")

while True:
    # Escoge una tarjeta aleatoriamente
    tarjeta = random.choice(tarjetas)
    
    # Escoge una puerta aleatoriamente
    puerta_id = random.choice(puertas)

    # Crea el JSON igual que tu ESP32
    body = {
        "tarjeta": int(tarjeta),
        "puerta": puerta_id
    }

    try:
        response = requests.post(URL, json=body)
        print(f"Tarjeta enviada: {tarjeta}, Puerta: {puerta_id}, Código HTTP: {response.status_code}")
        if response.status_code == 200:
            print(f"Respuesta del servidor: {response.text}")
    except Exception as e:
        print("Error al enviar:", e)

    # Espera 2 segundos antes del siguiente envío
    time.sleep(2)