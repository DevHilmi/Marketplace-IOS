//
//  APIhandler.swift
//  Pasar Suroboyo
//
//  Created by Hilmi on 6/17/17.
//  Copyright © 2017 PasarSuroboyo. All rights reserved.
//

import Foundation


var api = "i"
public struct Api {
    
   static var login:String = api+"/login"
   static var refresh = api+"/login/refresh"
   static var logout = api+"/logout"
  static  var register = api+"/register"
    
  static  var profil = api+"/profil"
  static  var updateProfile = api+"/update"
    
    //<slug-lapak>
  static  var infoLapak = api+"/api/lapak/"
  static  var daftarLapak = api+"/lapak/register"
  static  var rekeningLapak = api+"/lapak/rekening/set"
    
  static  var kategori = api+"/kategori"
    
 static   var addProduct = api+"/produk/tambah"
    //<id>
 static   var changeProduct = api+"/produk/ubah/"
    //<id>
 static   var deleteProduct = api+"/produk/hapus/"
    //<kategori-id><?page=halaman>
  static  var produkPerKategori = api+"/produk/"
    //<slug-lapak>/produk<?page=halaman>
 static   var produkPerLapak = api+"/lapak/"
    //<slug-lapak/produk/<slug-produk>
  static  var detailProduk = api+"/lapak/"
    
  static  var ambilIsiKeranjang = api+"/keranjang"
  static  var tambahKeKeranjang = api+"/keranjang/tambah"
  static  var hapusKeranjang = api+"/keranjang/hapus"
 static   var hapusSemuaKeranjang = api+"/keranjang/reset"
    
 static   var checkout = api+"/transaksi/checkout"
    //{id}
 static   var confirm = api+"/transaksi/confirm/"
  static  var daftarTransaksi = api+"/transaksi"
    //{id}
  static  var detailTransaksi = api+"/transaksi/"
    
  static  var alamat = api+"/alamat"
  static  var tambahAlamat = api+"alamat"
    
  static  var pengiriman = api+"/kurir"
    
   static var pembayaran = api+"/pembayaran/metode"
}
