# 1. ESCOLHE A IMAGEM BASE
# Usamos uma imagem oficial do Python, que já vem com o Python e pip prontos.
FROM python:3.11-slim

# 2. DEFINE O DIRETÓRIO DE TRABALHO
# Todos os comandos a seguir serão executados dentro desta pasta no contêiner.
WORKDIR /app

# 3. COPIA AS DEPENDÊNCIAS
# Copia o arquivo requirements.txt para o contêiner.
COPY requirements.txt .

# 4. INSTALA AS DEPENDÊNCIAS
# Instala o Flask e outras libs listadas no requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# 5. COPIA O CÓDIGO
# Copia o resto do seu código (app.py) para o diretório de trabalho.
COPY . .

# 6. EXPOE A PORTA
# Informa ao Docker que a aplicação dentro do contêiner vai escutar na porta 5000.
EXPOSE 5000

# 7. COMANDO DE INICIALIZAÇÃO
# Define o comando que será executado quando o contêiner for iniciado.
# Executa o app.py, que inicia o servidor Flask.
CMD ["python", "app.py"]