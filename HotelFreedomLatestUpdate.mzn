include "globals.mzn"; 

int: jlh_hotel;

enum Nama_Hotel;
array[Nama_Hotel] of int: Jumlah_Kamar;

%enum bintang;


%set of hotel;

array[1..jlh_hotel,1..5] of int: hotel;

% Set Statistik Harga Terendah, Tertinggi dan Harga Rata2
var int: Hrg_Tertinggi = max([hotel[p,5] | p in Nama_Hotel]);
var int: Hrg_Terendah = min([hotel[p,5] | p in Nama_Hotel]);
var int: Hrg_Rata2 = sum([hotel[p,5] | p in Nama_Hotel]) div jlh_hotel ;

%var int: hot1 = [hotel[p,1] | p in bin1];

% Define User Input
int: budget = 1000000;
int: userinput_hrg_mahal = budget ;
int: userinput_hrg_murah = budget ;

int: user_input_bintang = 1;
%%int: user_pesan_kamar = 1;

% Set Harga Hotel Termahal (Diatas Input User)
var set of Nama_Hotel: nama_hotel_termahal = { p | p in Nama_Hotel where hotel[p,5] >= userinput_hrg_mahal };
var int: jumlah_nama_hotel_termahal = card(nama_hotel_termahal);

% Set Harga Hotel Termurah (Dibawah Input User)
var set of Nama_Hotel: nama_hotel_termurah = {p | p in Nama_Hotel where hotel[p,5] <= userinput_hrg_murah };
var int: jumlah_nama_hotel_termurah = card(nama_hotel_termurah);

%var int: Hrg_Hotel = ;

var set of Nama_Hotel: bin1 = {p | p in Nama_Hotel where hotel[p,2] == 1};
var set of Nama_Hotel: bin2 = {p | p in Nama_Hotel where hotel[p,2] == 2};
var set of Nama_Hotel: bin3 = {p | p in Nama_Hotel where hotel[p,2] == 3};
var set of Nama_Hotel: bin4 = {p | p in Nama_Hotel where hotel[p,2] == 4};
var set of Nama_Hotel: bin5 = {p | p in Nama_Hotel where hotel[p,2] == 5};

%%var set of Nama_Hotel: totkamar = {p | p in bin1 where hotel[p,4] <= 400};
%set of int: totkamar = {p | p in nama_hotel_termurah where hotel[p,4] <= 400 };
%%var set of Nama_Hotel: kamar_tersedia = {p | p in nama_hotel_termurah where hotel[p,3] <= 400};
%set of int: kamar_tersedia = {p | p in bin1 where hotel[p,3] <= 400  };

bool: pesankamar = true;
%int: kamar_tersisa = totkamar - user_pesan_kamar;

solve satisfy;
%solve maximize  [hotel[p,5] | p in nama_hotel_termurah];
%constraint totkamar-user_pesan_kamar = kamar_tersedia;


constraint budget <= 1000000;
constraint jumlah_nama_hotel_termahal <= 12;
constraint jumlah_nama_hotel_termurah <= 12;
constraint assert(forall (p in Nama_Hotel) 
           (hotel[p,5] > 0), "Budget Tidak Boleh Kosong");
%constraint forall(p in bin1)(
%             if user_input_bintang == 1 then "\nHotel Dengan Bintang 1 : \(bin1)"
%             else if user_input_bintang == 2 then "\nHotel Dengan Bintang 1 : \(bin2)" 
 %            else if user_input_bintang == 3 then "\nHotel Dengan Bintang 1 : \(bin3)" 
  %           else if user_input_bintang == 4 then "\nHotel Dengan Bintang 1 : \(bin4)" 
   %          else if user_input_bintang == 5 then "\nHotel Dengan Bintang 1 : \(bin5)" 
    %         else "ERROR" endif

       
% constraint forall (p in Nama_Hotel) 
 %(used[r] <= capacity[r]);
           
       %  constraint assert(forall (r in Resources, p in Products) 
          % (consumption[p,r] >= 0), "Error: negative consumption");
          
       %   constraint forall (r in Resources) (     
    %  used[r] <= capacity[r]



output 
[
 "Jumlah Total Hotel : ", show(jlh_hotel)," Hotel\n",

 "Harga Hotel Terendah : \(Hrg_Terendah) IDR\n",

 "Harga Hotel Tertinggi: \(Hrg_Tertinggi) IDR\n",

 "Harga Hotel Rata-Rata: \(Hrg_Rata2) IDR\n\n",
 
 

 

 "Jumlah Hotel Diatas Harga ",show(budget)," adalah : \(jumlah_nama_hotel_termahal) (\(nama_hotel_termahal))\n",

 "Jumlah Hotel Dibawah Harga ",show(budget)," adalah : \(jumlah_nama_hotel_termurah) (\(nama_hotel_termurah))\n",

 

 "\n\nDaftar Hotel Diatas Harga : ",show(userinput_hrg_mahal),
 " IDR\n Nama Hotel : ", show(nama_hotel_termahal),
 "\n Harga Hotel (IDR) : ", show([hotel[p,5] | p in nama_hotel_termahal] ),
 "\n Bintang Hotel : ", show([hotel[p,2] | p in nama_hotel_termahal] ),
 "\n Jumlah Kamar Hotel : ", show([hotel[p,4] | p in nama_hotel_termahal] ),

 

 "\n\nDaftar Hotel Dibawah Harga : ",show(userinput_hrg_murah),
 " IDR\n Nama Hotel : ", show(nama_hotel_termurah),
 "\n Harga Hotel (IDR) : ", show([hotel[p,5] | p in nama_hotel_termurah] ),
 "\n Bintang Hotel : ", show([hotel[p,2] | p in nama_hotel_termurah] ),
  "\n Jumlah Kamar Hotel : ", show([hotel[p,4] | p in nama_hotel_termurah] ),
  
  "\n\nHotel Berbintang 1 : ",  show([hotel[p,1] | p in bin1]),
  "\nHotel Berbintang 2 : ",  show([hotel[p,1] | p in bin2]),
  "\nHotel Berbintang 3 : ",  show([hotel[p,1] | p in bin3]),
  "\nHotel Berbintang 4 : ",  show([hotel[p,1] | p in bin4]),
  "\nHotel Berbintang 5 : ",  show([hotel[p,1] | p in bin5])  ++   if user_input_bintang == 1 then "\n\nNama Hotel Dengan Bintang 1 : \(bin1)" 
                                                               elseif user_input_bintang == 2 then "\n\nNama Hotel Dengan Bintang 2 : \(bin2)" 
                                                               elseif user_input_bintang == 3 then "\n\nNama Hotel Dengan Bintang 3 : \(bin3)" 
                                                               elseif user_input_bintang == 4 then "\n\nNama Hotel Dengan Bintang 4 : \(bin4)" 
                                                               elseif user_input_bintang == 5 then "\n\nNama Hotel Dengan Bintang 5 : \(bin5)" 
                                                               else "INPUT TIDAK VALID" endif,
 %%  "\nHotel Berbintang 5 : ",  show(totkamar)        
                                                        %      ++ if pesankamar == true then totkamar
                                                        %        elseif pesankamar == false then kamar_tersedia else" " endif                                           
                                                               
]; 
 %" IDR\n\n Nama Hotel Berbintang 1 : ", show(bin1),
 
 
%output [ show(roster[i,j]) ++ if j==card(DAY) then "\n" else " " endif
      % | i in NURSE, j in DAY ]
 

% Rata2 Bintang Hotel 


% Set Rata2 Jumlah Kamar

%"\n\nJumlah Kamar Hotel Rata-Rata: \(sum([hotel[p,4] | p in Nama_Hotel]) div jlh_hotel )\n"


