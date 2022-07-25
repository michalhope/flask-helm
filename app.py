from flask import Flask, abort, jsonify
import os

app = Flask(__name__)

@app.route('/')
def home():
    return 'Welcome', 200

@app.route('/healthy')
def heath_check():
    return jsonify({"Status": "ok"}), 200

@app.route('/get_variable/<var_name>', methods=['GET'])
def get_variable(var_name):
    var = os.getenv(var_name)
    if (var is None):
        abort(500, description='Variable {} does not exists'.format(var_name))
    return jsonify(var), 200

@app.errorhandler(500)
def server_error(e):
    return jsonify(error=str(e)), 500

if __name__ == '__main__':
    app.run(debug=True)