from flask import Flask, request
import platform

app = Flask(__name__)

# Rota principal para verificar se a API está de pé
@app.route('/')
def home():
    return {"mensagem": "API de Teste Rodando com Python e Docker - Atualizacao V1!"}

# Rota para inspecionar o cliente (User-Agent e SO da API)
@app.route('/info')
def get_info():
    # Captura o cabeçalho User-Agent enviado pelo seu navegador/dispositivo
    user_agent = request.headers.get('User-Agent')

    # Captura o Sistema Operacional em que o contêiner está rodando (Linux)
    os_container = platform.system()

    return {
        "status": "OK",
        "mensagem": "Informações de Conexão:",
        "user_agent_cliente": user_agent,
        "os_do_container": os_container,
        "os_do_cliente_detectado": "Windows, iOS, etc. (dentro do User-Agent)"
    }

if __name__ == '__main__':
    # O host 0.0.0.0 é necessário para que a aplicação seja acessível de fora do contêiner
    app.run(host='0.0.0.0', port=5000)