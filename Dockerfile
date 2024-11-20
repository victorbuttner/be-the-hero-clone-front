# Etapa 1: Construir o aplicativo
FROM node:18 AS build

WORKDIR /app

# Copiar o package.json e instalar as dependências
COPY package*.json ./
RUN npm install

# Copiar o código e construir o aplicativo
COPY . .
RUN npm run build

# Etapa 2: Configurar o Nginx para servir os arquivos estáticos
FROM nginx:alpine

# Copiar os arquivos estáticos do build para o diretório padrão do Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Copiar uma configuração personalizada do Nginx (opcional)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expor a porta 80 para servir o aplicativo
EXPOSE 80

# Comando padrão para iniciar o Nginx
CMD ["nginx", "-g", "daemon off;"]
