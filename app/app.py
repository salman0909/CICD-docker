from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, CICD-docker!'

if __name__ == '__main__':
    app.run(debug=True, host='192.168.100.15')
