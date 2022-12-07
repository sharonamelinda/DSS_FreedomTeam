%Hotel Jakarta Barat
%
% Nama Hotel        Golongan               Jenis     Jumlah Kamar  Harga Permalam
% ------------------------------------------------+-------------------------------
% Ciputra           Bintang_1          Hotel_Bintang     100          100000
% Pullman           Bintang_2          Hotel_Melati      100          200000
% GreenTropic       Bintang_3          Hotel_Melati      100          300000
% MenaraPeninsula   Bintang_4          Hotel_Bintang     100          400000
% TwinPlaza         Bintang_5          Hotel_Melati      200          500000
% Santika           Bintang_1          Hotel_Bintang     200          600000
% GrandTjokro       Bintang_2          Hotel_Melati      200          700000
% Mercure           Bintang_3          Hotel_Melati      200          800000
% Ibis              Bintang_4          Hotel_Bintang     300          900000
% Jayakarta         Bintang_5          Hotel_Melati      300         1000000
% Capitol           Bintang_1          Hotel_Melati      300         2000000
% RoyalRegal        Bintang_2          Hotel_Bintang     300         3000000

include "globals.mzn"; 

%int: jlh_hotel = 12; 

%enum Nama_Hotel = {Ciputra,Pullman,GreenTropic,MenaraPeninsula,TwinPlaza,Santika,GrandTjokro,Mercure,Ibis,Jayakarta,Capitol,RoyalRegal};
%enum golongan = {Bintang_1,Bintang_2,Bintang_3,Bintang_4,Bintang_5};
%enum jenis = {Hotel_Bintang,Hotel_Melati,Motel};

%Array untuk menyimpan Dataset
%array[1..jlh_hotel,1..5] of int: hotel = array2d(Nama_Hotel,1..5, 
%[
%Ciputra          ,Bintang_1 ,Hotel_Bintang ,100, 100000,
%Pullman          ,Bintang_2 ,Hotel_Melati  ,100, 200000,
%GreenTropic      ,Bintang_3 ,Hotel_Melati  ,100, 300000,
%MenaraPeninsula  ,Bintang_4 ,Hotel_Bintang ,100, 400000,
%TwinPlaza        ,Bintang_5 ,Hotel_Melati  ,200, 500000,
%Santika          ,Bintang_1 ,Hotel_Bintang ,200, 600000,
%GrandTjokro      ,Bintang_2 ,Hotel_Melati  ,200, 700000,
%Mercure          ,Bintang_3 ,Hotel_Melati  ,200, 800000,
%Ibis             ,Bintang_4 ,Hotel_Bintang ,300, 900000,
%Jayakarta        ,Bintang_5 ,Hotel_Melati  ,300, 1000000,
%Capitol          ,Bintang_1 ,Hotel_Melati  ,300, 2000000,
%RoyalRegal       ,Bintang_2 ,Hotel_Bintang ,300, 3000000,
%]);

int: jlh_hotel;

enum Nama_Hotel;
enum golongan;
enum jenis;
% int: harga_max = 100000;
% int: harga_min = 1000000;

% var 0..sum(i in 1..jlh_hotel) (hotel[i]): sum_price;
%hotel mengarah ke data array di file .dzn
array[1..jlh_hotel,1..5] of int: hotel;
% set of int: Hotel = 1..5;
set of int: v0 = 0..10;
var v0: list_hotel;

% Set Statistik Harga Terendah, Tertinggi dan Harga Rata2
% var int: Hrg_Tertinggi = max([hotel[p,5] | p in Nama_Hotel]);
% var int: Hrg_Terendah = min([hotel[p,5] | p in Nama_Hotel]);
var int: avg;
var int: min;
var int: max;
% set of int: 
% Define User Input
int: userinput_hrg_mahal = 3000000;
int: userinput_hrg_murah = 3000000;
int: selected_harga;
% int: userinput_hrg_murah;

%harga harus sesuai range user input
constraint
%   forall(p in Nama_Hotel) (
%     max = max([hotel[p,5] | p in Nama_Hotel]);
%     min = min([hotel[p,5] | p in Nama_Hotel]);
%     avg = sum([hotel[p,5] | p in Nama_Hotel]) div jlh_hotel ;
%   );
     for (i in hotel)(
     hotel[i,5] <= userinput_hrg_mahal /\ hotel[i,5] >= userinput_hrg_murah)
;
  
solve satisfy;

output[
  "avg: \(selected_harga)\n",

];

% Set Harga Hotel Termahal (Diatas Input User)
/*var set of Nama_Hotel: nama_hotel_termahal = { p | p in Nama_Hotel where hotel[p,5] >= userinput_hrg_mahal };
var int: jumlah_nama_hotel_termahal = card(nama_hotel_termahal);

%var int: Hrg_Hotel = ;

% Set Harga Hotel Termurah (Dibawah Input User)
var set of Nama_Hotel: nama_hotel_termurah = {p | p in Nama_Hotel where hotel[p,5] <= userinput_hrg_murah };
var int: jumlah_nama_hotel_termurah = card(nama_hotel_termurah);

solve satisfy;
% solve :: int_search(x, first_fail, indomain_min, complete) satisfy;

constraint
  true
;

output 
[
 "Harga Hotel Terendah : \(Hrg_Terendah) IDR\n",
 "Harga Hotel Tertinggi: \(Hrg_Tertinggi) IDR\n",
 "Harga Hotel Rata-Rata: \(Hrg_Rata2) IDR\n\n",
 
 "Jumlah Hotel Diatas Harga ",show(userinput_hrg_mahal)," adalah : \(jumlah_nama_hotel_termahal) (\(nama_hotel_termahal))\n",
 "Jumlah Hotel Dibawah Harga ",show(userinput_hrg_mahal)," adalah : \(jumlah_nama_hotel_termurah) (\(nama_hotel_termurah))\n",
 
 "\n\nDaftar Hotel Diatas Harga : ",show(userinput_hrg_mahal)," IDR\n Nama Hotel : ", show(nama_hotel_termahal),"\n Harga Hotel (IDR) : ",
 show([hotel[p,5] | p in nama_hotel_termahal] ),
 
 "\n\nDaftar Hotel Dibawah Harga : ",show(userinput_hrg_murah)," IDR\n Nama Hotel : ", show(nama_hotel_termurah),"\n Harga Hotel (IDR) : ",
 show([hotel[p,5] | p in nama_hotel_termurah] ),
 
% Rata2 Bintang Hotel 
  
% Set Rata2 Jumlah Kamar
%"\n\nJumlah Kamar Hotel Rata-Rata: \(sum([hotel[p,4] | p in Nama_Hotel]) div jlh_hotel )\n"

];*/

