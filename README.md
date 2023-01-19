# Projek Mata Kuliah Sistem Pendukung Keputusan
## Sistem Pendukung Keputusan Pemilihan Hotel di Jakarta
### Informatika UKRIDA

Group: Freedom
Member: 
- Valiant D (412016014)
- Sharon A (412019008)
- Baptista V (412019019)
- Albert S (412019043)

Program ini bekerja untuk DSS pemilihan hotel berdasarkan requirement yang diinput user. Inputan dari user berperan sebagai filter pada dataset yang ada. Dataset yang digunakan berupa data dummy yang hanya terdiri dari beberapa array. Untuk development lebih lanjut akan di enhance supaya bisa menggunakan dataset yang lebih kompleks. 


Bagian WEB
Pada XAMPP -> APACHE
Lakukan pengaturan agar dapat menghubungkan web aplication dengan PYTHON
Pada XAMPP Control Panel
    Klik tombol config pada module Apache,
    Lalu pilih Apache(httpd.conf),
    Maka muncul file httpd.conf dengan aplikasi notepad.

** File httpd.conf 
    Lakukan pengaturan pada file httpd.conf dengan menambahkan beberaba baris code.
    Cari tag <Directory></Directory>dan ubah menjadi seperti berikut:
    <Directory />    
        AllowOverride None
        Options ExecCGI
        Order allow,deny
        Allow from all
    </Directory>

    dan 

    <Directory "C:/xampp/cgi-bin">    
        AllowOverride None
        Options None
        Require all granted
        Options +ExecCGI
        AddHandler cgi-script .cgi .pl .py
    </Directory>

    line Addhandler dapat ditulis didalam tag <Directory></Directory> atau di luar seperti dibawah ini.

    AddHandler cgi-script .cgi .pl .asp .py

    setelah itu save, dan restart module Apache.

    

