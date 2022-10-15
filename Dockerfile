## Comando obrigatório
## Baixa a imagem do node com a versão
FROM node:16-alpine3.15

## Define o local onde o app vai ficar no disco do container (pode ser qualquer diretorio)
WORKDIR /usr/app

## Copia tudo que começa com package e termina com .json para dentro da pasta /usr/app
COPY package*.json ./

## Executa npm install para adicionar as dependências e criar a pasta node_modules
RUN npm install

## Copia tudo que está no diretório onde o arquivo Dockerfile está 
## para dentro da pasta /usr/app do container
## Vamos ignorar a node_modules por isso criaremos um .dockerignore
COPY . .

## Container ficará ouvindo os acessos na porta 3000
EXPOSE 3000

## Executa o comando npm start para iniciar o script que que está no package.json
CMD npm start


####################################################################################
# executa o comando no terminal
####################################################################################
# docker build -t reactjs/dockernode .
# docker compose up // roda e sobe e fica com hot reload
# docker run -p 3000:3000 -d reactjs/dockernode // roda e sobe mas nao funciona o hot reload
