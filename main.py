import minizinc, json, json2html
from flask import Flask, request, render_template, redirect, url_for
from contextlib import redirect_stdout

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/result", methods=['POST'])
def post_index():

    #getting user input from form
    selectCity = request.form.get("userinput_kota")
    starRange = request.form.get("minimal_input_bintang")
    minCost = request.form.get("userinput_hrg_murah")
    maxCost = request.form.get("userinput_hrg_mahal")
    
    model = minizinc.Model("main_project.mzn")
    # model.add_file("Dataset/hotel_JakartaPusat.dzn")

    #func to choose city from input, so user can choose different area to get different results
    def select_city(city):
        if city == 'JakartaBarat':
            model.add_file("Dataset/hotel_JakartaBarat.dzn")
        elif city == 'JakartaPusat':
            model.add_file("Dataset/hotel_JakartaPusat.dzn")
        elif city == 'JakartaTimur':
            model.add_file("Dataset/hotel_JakartaTimur.dzn")
        elif city == 'JakartaSelatan':
            model.add_file("Dataset/hotel_JakartaSelatan.dzn")
        elif city == 'JakartaUtara':
            model.add_file("Dataset/hotel_JakartaUtara.dzn")

    select_city(selectCity)
    gecode = minizinc.Solver.lookup("gecode")

    instance = minizinc.Instance(gecode, model)
    instance['userinput_hrg_mahal'] = int(maxCost)
    instance['userinput_hrg_murah'] = int(minCost)
    instance['minimal_input_bintang'] = int(starRange)
    instance['userinput_kota'] = selectCity 

    result = instance.solve()

    #creating dictionary and filtering from minizinc array output
    output = dict()
    array_hotel_termurah = list()
    for i in range(len(result.solution.nama_hotel_termurah)):
        if result.solution.nama_hotel_termurah[i] != 'nill_hotel' and result.solution.bintang_hotel_termurah[i] != 'nill_golongan':
            temp = list()
            temp.append(result.solution.nama_hotel_termurah[i])       
            temp.append(result.solution.bintang_hotel_termurah[i].replace('_', ' '))
            array_hotel_termurah.append(temp)

    output["array_hotel_termurah"] = array_hotel_termurah

    array_hotel_termahal = list()
    for i in range(len(result.solution.nama_hotel_termahal)):
        if result.solution.nama_hotel_termahal[i] != 'nill_hotel' and result.solution.bintang_hotel_termahal[i] != 'nill_golongan':
            temp = list()
            temp.append(result.solution.nama_hotel_termahal[i])       
            temp.append(result.solution.bintang_hotel_termahal[i].replace('_', ' '))
            array_hotel_termahal.append(temp)
        
    output["array_hotel_termahal"] = array_hotel_termahal

    output["input_max"] = int(maxCost)
    output["input_min"] = int(minCost)
    output['input_kota'] = selectCity

    #redirecting to result page and delivering the output to show 
    return render_template('result.html', result=output)

if __name__ == "__main__":
    app.run()
