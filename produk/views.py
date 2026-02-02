from django.shortcuts import render, redirect, get_object_or_404
from django.db.models import Max
from .models import Produk
from .forms import ProdukForm

def index(request):
    data_produk = Produk.objects.filter(status__nama_status='bisa dijual').select_related('kategori', 'status')
    return render(request, 'produk/list.html', {'produks': data_produk})

def tambah(request):
    if request.method == "POST":
        form = ProdukForm(request.POST) 
        if form.is_valid():
            produk_baru = form.save(commit=False)
            max_id = Produk.objects.aggregate(Max('id_produk'))['id_produk__max']
            if max_id is None:
                produk_baru.id_produk = 1
            else:
                produk_baru.id_produk = max_id + 1
            
            produk_baru.save()
            return redirect('index')
    else:
        form = ProdukForm()
    return render(request, 'produk/form.html', {'form': form, 'judul': 'Tambah Produk'})

def edit(request, id_produk):
    produk = get_object_or_404(Produk, pk=id_produk)
    if request.method == "POST":
        form = ProdukForm(request.POST, instance=produk)
        if form.is_valid():
            form.save()
            return redirect('index')
    else:
        form = ProdukForm(instance=produk)
    return render(request, 'produk/form.html', {'form': form, 'judul': 'Edit Produk'})

def hapus(request, id_produk):
    produk = get_object_or_404(Produk, pk=id_produk)
    produk.delete()
    return redirect('index')