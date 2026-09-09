# 1. Usa a imagem oficial e atualizada do servidor do Luanti (Minetest)
FROM ghcr.io/luanti-org/luanti:latest

# 2. Cria a pasta interna onde o motor do jogo lê sub-jogos
RUN mkdir -p /var/lib/minetest/.minetest/games/

# 3. Copia a pasta do seu jogo open_lands para o local correto dentro do servidor
COPY ./open_lands /var/lib/minetest/.minetest/games/open_lands

# 4. Copia as configurações básicas do servidor se o arquivo existir
COPY ./minetest.conf /etc/minetest/minetest.conf

# 5. Informa ao Render para liberar a porta padrão de rede do jogo
EXPOSE 30000/udp

# 6. Comando de inicialização que liga o servidor apontando para o Terras Abertas
CMD ["--config", "/etc/minetest/minetest.conf", "--gameid", "open_lands", "--port", "30000"]
