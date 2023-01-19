include "globals.mzn"; 
int: jlh_hotel;
enum Nama_Hotel;
enum golongan;
enum jenis;
enum fasilitas;
int: userinput_hrg_mahal;
int: userinput_hrg_murah;
int: minimal_input_bintang;
array[fasilitas] of int: userinput_fasilitas = [0,0,0,1,0,0];

array[1..jlh_hotel,1..5] of int: hotel;
array[1..jlh_hotel,1..6] of int: facility;

array[1..jlh_hotel] of var Nama_Hotel: nama_hotel_termurah;
array[1..jlh_hotel] of var Nama_Hotel: nama_hotel_termahal;

array[1..jlh_hotel] of var golongan: bintang_hotel_termurah;
array[1..jlh_hotel] of var golongan: bintang_hotel_termahal;

constraint
    forall(i in 1..jlh_hotel)(  if hotel[i,5]<= userinput_hrg_murah then 
       nama_hotel_termurah[i] = Nama_Hotel[i] endif
    ) 
    /\
    forall(i in 1..jlh_hotel)(  if hotel[i,5]>= userinput_hrg_mahal then 
       nama_hotel_termahal[i] = Nama_Hotel[i] endif
    ) 
    /\
    forall(i in 1..jlh_hotel)(  if hotel[i,5]<= userinput_hrg_murah then 
       bintang_hotel_termurah[i] = hotel[i,2] endif
    ) 
    /\
    forall(i in 1..jlh_hotel)(  if hotel[i,5]>= userinput_hrg_mahal then 
       bintang_hotel_termahal[i] = hotel[i,2] endif
    ) 
  ;

solve satisfy;