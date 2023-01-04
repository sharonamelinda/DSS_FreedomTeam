#!C:\Users\albert\AppData\Local\Programs\Python\Python39\python.exe

import cgi,os
import json
print('Location: http://localhost/Hotel2/index.php?navigasi=A1\r\n\r'); #Redirect page after user input specification hotel.

form=cgi.FieldStorage()
# Get value from form HTML to python
cityHotel=str(form.getvalue("selectCity"))
starHotel=str(form.getvalue("starRange"))
numGuest=str(form.getvalue("numberOfGuests"))
priceMin=str(form.getvalue("minPrice"))
priceMax=str(form.getvalue("maxPrice"))

# Minizinc code here



# Create JSON from result process Minizinc
dataFilter = {'Kota':cityHotel,'BintangHotel':starHotel,'JumlahTamu':numGuest,'HargaTerendah':priceMin,'HargaTertinggi':priceMax,}

# To write JSON to a file JSON:
with open("output.json", "w") as f:
    json.dump(dataFilter, f)

# To print out the JSON string 
json.dumps(dataFilter)