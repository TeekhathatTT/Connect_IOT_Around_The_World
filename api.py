from flask import Flask, jsonify, request

app = Flask(__name__)
data_list = []

@app.route('/api/data', methods=['GET'])
def get_data():
    return jsonify({'data' : data_list})

@app.route('/api/data', methods=['POST'])
def post_data():
    data = request.get_json()
    data_list.append(data)
    return jsonify({'received_data': data})

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug = True)