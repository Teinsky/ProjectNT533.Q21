from flask import Flask, Response
import time, random

app = Flask(__name__)

@app.route('/')
def index():
    return 'Private Cloud Demo v1.0 - UIT 2025'

@app.route('/health')
def health():
    return {'status': 'ok', 'version': '1.0'}

@app.route('/metrics')
def metrics():
    return Response(
        '# HELP http_requests_total Total HTTP requests\n'
        '# TYPE http_requests_total counter\n'
        'http_requests_total 100\n'
        'app_up 1\n',
        mimetype='text/plain'
    )

@app.route('/stress')
def stress():
    # Tạo tải CPU trong 30 giây để test HPA
    end = time.time() + 30
    result = 0
    while time.time() < end:
        result += random.random() ** 0.5
    return f'stress done, result={result:.2f}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)