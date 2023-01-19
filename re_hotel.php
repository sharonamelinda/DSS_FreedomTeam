<script>
    //Read and print JSON file to Table    
    function readTextFile(file, callback) {
        var rawFile = new XMLHttpRequest();
        rawFile.overrideMimeType("application/json");
        rawFile.open("GET", file, true);
        rawFile.onreadystatechange = function() {
            if (rawFile.readyState === 4 && rawFile.status == "200") {
                callback(rawFile.responseText);
            }
        }
        rawFile.send(null);
    }
    readTextFile("output.json", function(text){
        var mydata = JSON.parse(text);
        console.log(mydata);               
        tr = $('<tr/>');
        tr.append("<td>" + mydata.Kota + "</td>");
        tr.append("<td>" + mydata.BintangHotel + "</td>");
        tr.append("<td>" + mydata.JumlahTamu + "</td>");
        tr.append("<td>" + mydata.HargaTerendah + "</td>");
        tr.append("<td>" + mydata.HargaTertinggi + "</td>");
        $('#table').append(tr);
    });            
</script>
<script>   
    $(document).ready(function(){
        $('#formModalRecomendasi').modal({
            show: true
        })
    });
</script>

<header> 
    <div class="cs1 col-md-12 col-sm-12">   
        <div id="carousel" class="cs carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="asset/image/image1.jpg" alt="">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="asset/image/image2.jpg" alt="">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="asset/image/image3.jpg" alt="">
                </div>
            </div>
        </div>
        <div class="container">
            <h1 class="text text-success text-center ">
                Data yang anda Input
            </h1>            
            <table class="table table-striped text-center">
                <thead>
                    <tr>
                        <th>KOTA</th>
                        <th>HOTEL BINTANG</th>
                        <th>JUMLAH TAMU</th>
                        <th>HARGA TERENDAH</th>
                        <th>HARGA TERTINGGI</th>
                    </tr>
                </thead>
                <tbody id="table" class="text-center">
                    
                </tbody>
                
            </table>
        </div>
        
        <!-- -------------------------------------Modal---------------------------------------- -->
        <div id="formModalRecomendasi" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cari hotel sesuai kebutuhan anda</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>                    
                    </div>
                    <div class="modal-body btn_modal2">
                        <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#formModalRecomendasi_1" data-dismiss="modal">Mulai mencari</button>                
                    </div>
                </div>
            </div>
        </div>
        <!-- -------------------------------------End-Modal---------------------------------------- -->

        <!-- --------------------------------------Modal_1----------------------------------------- -->
        <div id="formModalRecomendasi_1" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <!-- action="HomeController/result" -->
                <div class="modal-content">   
                    <!-- FORM  -->
                    <form methode="post" action="app.py">
                        <div class="modal-body">                
                            <div class="form-group">
                                <label for="FormControlSelectCity">Kota tujuan:</label>
                                <select class="form-control" id="selectCity" name="selectCity">
                                    <option>Jakarta Utara</option>
                                    <option>Jakarta Timur</option>
                                    <option>Jakarta Barat</option>
                                    <option>Jakarta Selatan</option>
                                    <option>Jakarta Pusat</option>
                                </select>                        
                            </div> 
                            <hr>
                            <div class="slidecontainer">
                                <label>Bintang hotel:  <span id="rate"></span></label>                            
                                <input type="range" min="1" max="5" value="1" class="slider" id="starRange" name="starRange">                                
                            </div>
                            <hr>
                            <div class="guest">
                                <label>Jumlah tamu</label><br> 
                                <i class="fa fa-minus" aria-hidden="true" id="decreas"></i>
                                <input id="numberOfGuests" type="number" value="1" name="numberOfGuests" readonly>
                                <i class="fa fa-plus" aria-hidden="true" id="add"></i>
                            </div>
                            <hr>
                            <div class="slidecontainer">
                                <label>Harga terendah:  <span id="min_Price"></span></label>                            
                                <input type="range" min="0" max="999999" value="200000" class="slider" id="minPrice" name="minPrice">                                
                            </div>
                            <div class="slidecontainer">
                                <label>Harga tertinggi:  <span id="max_Price"></span></label>                            
                                <input type="range" min="0" max="999999" class="slider" id="maxPrice" name="maxPrice">                                
                            </div>
                            <hr>
                        </div>
                        <div class="modal-footer">
                            <button id="button" type="submit" class="btn btn-default">Submit</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        </div>       
                        <!-- onclick='sendDataToPython();' data-dismiss="modal"  //using for function sendDataToPython() script-->
                    </form>
                    <!-- END FORM -->
                </div>
            </div>
        </div>        
        <!-- --------------------------------------End-Modal_1----------------------------------------- -->

        

        
        
        <script>
            // Slider
            var slider = document.getElementById("starRange"); // Get Value From Input User
            var output = document.getElementById("rate"); //Get value from slider
            output.innerHTML = slider.value; // Display the default slider value
            // Update the current slider value (each time you drag the slider handle)
            slider.oninput = function() {
                output.innerHTML = this.value;
            }
        </script>
            
        <script>
            // Input number of guest
            // Defined minimum guest and maximum guest
            var min = 1,
                max = 5;
            // Add guest
            $("#add").click(function(){
            if($("#numberOfGuests").val() < max && $("#numberOfGuests").val() >= min )
                $("#numberOfGuests").val(Number($("#numberOfGuests").val()) + 1);  // increment
            });
            // Decreas Guest
            $("#decreas").click(function(){
            if($("#numberOfGuests").val() <= max && $("#numberOfGuests").val() > min )
                $("#numberOfGuests").val(Number($("#numberOfGuests").val()) - 1);  // decrement
            }); 
        </script>
           
        <script>
            // Slider Minimum dan Maximum Price
            var slider1 = document.getElementById("minPrice"); // Get Value From Input User
            var output1 = document.getElementById("min_Price"); //Get value from slider
            output1.innerHTML = slider1.value; // Display the default slider value
            // ======================================
            document.getElementById("minPrice").addEventListener("change", function() {
                let v1 = parseInt(this.value);                
                if(v1 > slider2.value) this.value = slider2.value;
                output1.innerHTML = slider1.value; // Display the default slider value
                // Update the current slider value (each time you drag the slider handle)
                slider1.oninput = function() {
                    output1.innerHTML = this.value;
                }; 
            });
            // ======================================
            document.getElementById("maxPrice").addEventListener("change", function() {
                let v2 = parseInt(this.value);                
                if(v2 < slider1.value) this.value = slider1.value;
                output2.innerHTML = slider2.value; // Display the default slider value
                // Update the current slider value (each time you drag the slider handle)
                slider2.oninput = function() {
                    output2.innerHTML = this.value;
                }; 
            });
            // Slider Maximum Price
            var slider2 = document.getElementById("maxPrice"); // Get Value From Input User
            var output2 = document.getElementById("max_Price"); //Get value from slider            
            output2.innerHTML = slider2.value; // Display the default slider value
        </script>       
            
        <script>
            // Get Value From Input User to JSON
            // function sendDataToPython() {
            //     const cityHotel = document.getElementById("selectCity").value;
            //     const starHotel = document.getElementById("starRange").value;
            //     const numGuest = document.getElementById("numberOfGuests").value;
            //     const priceMin = document.getElementById("minPrice").value;
            //     const priceMax = document.getElementById("maxPrice").value;

                
            //     const findHotel = {cityHotel, starHotel, numGuest, priceMin, priceMax} //Pass the javascript variables to a dictionary.
            //     const s = JSON.stringify(findHotel); // Stringify converts a JavaScript object or value to a JSON string
            //     console.log(s); // Prints the variables to console window, which are in the JSON format                
            //     window.alert(s)               
            //     $.ajax({
            //         url:"/data",
            //         type:"POST",
            //         contentType: "application/json",
            //         data: JSON.stringify(s)
            //     });
            // } 
        </script>

        
       
    </div>
</header>