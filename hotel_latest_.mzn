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
% include "Dataset/HotelDataset_JakartaBarat.dzn";

% file dzn yg di gunakan yg ada array biner untuk facility 
int: n =  card(Nama_Hotel);
int: jlh_hotel;
enum Nama_Hotel;
enum golongan;
enum jenis;
enum fasilitas;

array[1..jlh_hotel,1..5] of int: hotel;
array[1..jlh_hotel,1..5] of int: facility; %hub fasilitas dengan array fasilitas

% Define User Input
int: userinput_hrg_mahal = 900000;
int: userinput_hrg_murah = 300000;
int: minimal_input_bintang = 4;
array[fasilitas] of int: userinput_fasilitas = [0,0,1,0,0];

% Set Harga Hotel Termahal (Diatas Input User)
var set of Nama_Hotel: nama_hotel_termahal;
var int: jumlah_nama_hotel_termahal = card(nama_hotel_termahal);
var set of Nama_Hotel: nama_hotel_termurah;
var int: jumlah_nama_hotel_termurah = card(nama_hotel_termurah);
var set of Nama_Hotel: nama_hotel_bintang;
var int: jumlah_hotel_sesuai_bintang = card(nama_hotel_bintang);

solve satisfy;
constraint
  nama_hotel_termurah = {p | p in Nama_Hotel where hotel[p,5] <= userinput_hrg_murah /\ 
    forall(g in fasilitas)(
      facility[p,g] >= userinput_fasilitas[g]) /\ 
      hotel[p,2] <= minimal_input_bintang
    }
  /\
  nama_hotel_termahal = {p | p in Nama_Hotel where hotel[p,5] >= userinput_hrg_mahal /\ 
    forall(g in fasilitas)(
      facility[p,g] >= userinput_fasilitas[g]) /\ 
      hotel[p,2] <= minimal_input_bintang
    } 
  ;

output 
[
  "Requirement : ",
  "\n Harga <= ", show(userinput_hrg_murah)," & >= ", show(userinput_hrg_mahal)," ; \nBintang Hotel <= ", show(minimal_input_bintang),"\n",
  
  "\nHasil : ",
 "\nJumlah Hotel Diatas Harga ",show(userinput_hrg_mahal)," adalah : \(jumlah_nama_hotel_termahal) (\(nama_hotel_termahal))\n",
 "Jumlah Hotel Dibawah Harga ",show(userinput_hrg_murah)," adalah : \(jumlah_nama_hotel_termurah) (\(nama_hotel_termurah))\n",
 
 "\nDaftar Hotel Diatas Harga : ",show(userinput_hrg_mahal)," IDR\n Nama Hotel : ", show(nama_hotel_termahal),"\n Harga Hotel (IDR) : ",
 show([hotel[p,5] | p in nama_hotel_termahal] ),
 " \n Bintang : ", show([hotel[p,2] | p in nama_hotel_termahal ]),
 
 "\n\nDaftar Hotel Dibawah Harga : ",show(userinput_hrg_murah)," IDR\n Nama Hotel : ", show(nama_hotel_termurah),"\n Harga Hotel (IDR) : ",
 show([hotel[p,5] | p in nama_hotel_termurah]),
 " \n Bintang : ", show([hotel[p,2] | p in nama_hotel_termurah ]),
];