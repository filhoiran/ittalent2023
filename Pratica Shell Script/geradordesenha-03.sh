#!/bin/bash

<<'--COMENTARIO--'
Questão 3 - Gerador de Senha *
Crie um Shell Script que faça a geração aleatória de senha.
Quando for executado o script o console deve perguntar qual o tamanho da senha que eu desejo e digitando
o valor numérico ele retorne com uma senha aleatória contendo letras minúsculas e maiúsculas e números.
Dica: Em sistemas operacionais do tipo Unix, /dev/random, /dev/urandom e /dev/arandom
são arquivos especiais que servem como geradores de números pseudo-aleatórios.
--COMENTARIO--

# Solicita um tamanho para a senha
read -p "Digite o tamanho da senha desejado de 0 a 10 caracteres: " qtd

# Verifica se o tamanho inserido é um número válido
if ! [[ "$qtd" =~ ^[0-9]+$ ]] || [ "$qtd" -lt 0 ] || [ "$qtd" -gt 10 ]; then
    echo "Por favor, insira um número entre 0 e 10 para o tamanho da senha."
    exit 1
fi

# Caracteres que podem ser usados na senha
caracteres="abcdefghijlmnopqrstuvwxyzABCDEFGHIJLMNOPQRSTUVWXYZ0123456789?@#%*_-+./"

# Gerando senha aleatória usando /dev/urandom
#senha=$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c "$qtd")

# Gerando senha aleatóriamente usando /dev/random
senha=""
for ((i = 0; i < qtd; i++)); do
    indice=$((RANDOM % ${#caracteres}))
    senha="${senha}${caracteres:$indice:1}"
done

    echo "'—————————————————————————————'"
    echo "→ Nova senha gerada: $senha"
    echo "'—————————————————————————————'"
