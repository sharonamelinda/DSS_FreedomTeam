import minizinc, json, json2html
from flask import Flask, request, render_template, redirect, url_for
from contextlib import redirect_stdout

model = minizinc.Model("hotel_latest_.mzn")
#can add if for choosing dataset for different area : Jaktim/Jakbar etc.
model.add_file("Dataset/HotelDataset_JakartaBarat.dzn")
gecode = minizinc.Solver.lookup("gecode")
instance = minizinc.Instance(gecode, model)
result = instance.solve()

#creating/replace file as temp for minizinc result
with open('data.txt', 'w') as f:
    with redirect_stdout(f):
        print(result)
