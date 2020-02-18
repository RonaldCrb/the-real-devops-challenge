# Usamos imagen de Python version con linux Alpine
# utilizamos una etiqueta con version fija 
FROM python:3.8.1-alpine

LABEL title="the-real-devops-challenge"
LABEL description="Prueba de codigo Ron Alonzo DevOps Engineer"
LABEL maintainer="Ron Alonzo alonzo.ronald@gmail.com"

# primero copiamos el requirements.txt para aprovechar mejor el layer cache de docker
COPY ./requirements.txt /app/requirements.txt

# nos ubicamos en el directorio /app dentro del contenedor
WORKDIR /app

# instalamos los requerimientos
RUN pip install -r requirements.txt

# copiamos el resto de la aplicacion
COPY . /app

# asignamos python como comando ejecutable
ENTRYPOINT [ "python" ]

# pasamos el nombre de nuestro archivo principal como argumento del comando de inicializacion
CMD [ "app.py" ]