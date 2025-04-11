from flask import Flask, request, jsonify, make_response
import pandas as pd
from pre import predict
import json
from flask_cors import CORS
#pip install flask_cors 설치

app = Flask(__name__)
CORS(app)
app.config['JSON_AS_ASCII'] = False

@app.route('/model', methods=["GET"])
def model():
    gu_code = request.args.get("code")
    print(gu_code)
    if not gu_code:
        data = {"code" : 400, "errormessage" : "구코드는 필수 입력값 입니다.","result" : []}
        response = make_response(json.dumps(data, ensure_ascii=False))
        response.status_code = 400
        return response
    else :
        pred_data = predict(int(gu_code))
        if pred_data:
            data = {"code" : 200, "result" : pred_data}
            response = make_response(json.dumps(data, ensure_ascii=False))
            response.status_code = 200  # HTTP 상태 코드 설정
            return response
        else:
            data = {"code" : 500, "errormessage" : "자치구에 CS1~CS3 그룹 예측 결과가 존재하지 않습니다.","result" : []}
            response = make_response(json.dumps(data, ensure_ascii=False))
            response.status_code = 500  # HTTP 상태 코드 설정
            return response
app.run(debug=True, host="0.0.0.0")