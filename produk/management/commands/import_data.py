import requests
import hashlib
from datetime import datetime
from django.core.management.base import BaseCommand
from produk.models import Produk, Kategori, Status

class Command(BaseCommand):
    help = 'Import data dari API FastPrint'

    def handle(self, *args, **kwargs):
        now = datetime.now()
        
        password_str = f"bisacoding-{now.day:02d}-{now.month:02d}-{str(now.year)[-2:]}"
        password_md5 = hashlib.md5(password_str.encode()).hexdigest()
        username = f"tesprogrammer{now.day:02d}{now.month:02d}{str(now.year)[-2:]}C{now.hour:02d}"

        # URL API
        url = "https://recruitment.fastprint.co.id/tes/api_tes_programmer"
        
        payload = {
            'username': username,
            'password': password_md5
        }

        self.stdout.write(f"--- INFO LOGIN ---")
        self.stdout.write(f"User: {username}")
        self.stdout.write(f"Pass String: {password_str}")
        self.stdout.write(f"Mencoba menghubungi server...")

        try:
            response = requests.post(url, data=payload)
            response.raise_for_status()
            
            try:
                data = response.json()
            except ValueError:
                self.stdout.write(self.style.ERROR(f"Error: Server tidak mengembalikan JSON. Response:\n{response.text[:200]}"))
                return

            if data.get('error') == 0:
                self.stdout.write(self.style.SUCCESS("Login Berhasil! Mulai menyimpan data..."))
                
                jumlah_sukses = 0
                
                for item in data['data']:
                    if not item.get('nama_produk'): 
                        continue

                    kategori_obj, _ = Kategori.objects.get_or_create(
                        nama_kategori=item['kategori']
                    )
                    
                    status_obj, _ = Status.objects.get_or_create(
                        nama_status=item['status']
                    )

                    raw_harga = item.get('harga')
                    if raw_harga and str(raw_harga).isdigit():
                        harga_bersih = int(raw_harga)
                    else:
                        harga_bersih = 0
                    
                    Produk.objects.update_or_create(
                        id_produk=item['id_produk'],
                        defaults={
                            'nama_produk': item['nama_produk'],
                            'harga': harga_bersih,
                            'kategori': kategori_obj,
                            'status': status_obj
                        }
                    )
                    jumlah_sukses += 1
                
                self.stdout.write(self.style.SUCCESS(f'Selesai! {jumlah_sukses} produk berhasil diproses.'))
            else:
                pesan_error = data.get('ket', 'Unknown error')
                self.stdout.write(self.style.ERROR(f"Gagal Login API: {pesan_error}"))

        except Exception as e:
            self.stdout.write(self.style.ERROR(f"Terjadi Error System: {e}"))