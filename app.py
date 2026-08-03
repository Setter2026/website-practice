from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "<h1>Sarah's App is Live via the Platform!</h1>"

if __name__ == '__main__':
    