from flask import Flask, render_template, request, redirect, jsonify

app = Flask(__name__)
#json문자열 인코딩 변경
app.config["JSON_AS_ASCII"] = False

@app.route("/")
def main():
    return render_template("map.html")


app.run(debug=True)