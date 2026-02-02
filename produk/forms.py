from django import forms
from .models import Produk, Kategori, Status

class ProdukForm(forms.ModelForm):
    class Meta:
        model = Produk
        fields = ['nama_produk', 'harga', 'kategori', 'status']
        
        widgets = {
            'nama_produk': forms.TextInput(attrs={'class': 'form-control', 'required': True}),
            'harga': forms.NumberInput(attrs={'class': 'form-control', 'required': True, 'min': '0'}),
            'kategori': forms.Select(attrs={'class': 'form-control'}),
            'status': forms.Select(attrs={'class': 'form-control'}),
        }
        
        labels = {
            'nama_produk': 'Nama Produk',
            'harga': 'Harga (Rp)',
            'gambar': 'Foto Produk (Opsional)',
        }

    def clean_harga(self):
        harga = self.cleaned_data.get('harga')
        if harga is not None and harga < 0:
            raise forms.ValidationError("Harga tidak boleh negatif.")
        return harga