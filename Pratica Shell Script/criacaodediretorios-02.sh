#!/bin/bash

<<'--COMENTARIO--'
Questão 2 - Criação de Pastas *
Crie um Shell Script que faça a criação de 10 diretórios de forma automática.
Dica: Utilize laços de repetição.
--COMENTARIO--

    read -p "Digite um nome BASE para os 10 diretórios: " nome_diretorio

# Verifica se o diretório já existe
if [ -d "$nome_diretorio" ]; then
    echo "O diretório '$nome_diretorio' já existe, porfavor especifique outro um nome."
    exit 1
fi

# Criado diretório base
mkdir "$nome_diretorio"
echo "_______________________________________________________"
echo "→ O Diretório principal '$nome_diretorio' foi criado com sucesso!."
echo "_______________________________________________________"

# Entrando no diretório base criado
cd "$nome_diretorio"

# Loop para criar os 10 subdiretórios:
for i in {1..10}; do
    #diretorios="diretorios_$i"
    diretorios="$nome_diretorio"

    # Verificando se o diretório já existe
    if [ ! -d "$diretorios-$i" ]; then
        echo "Criando subdiretório '$diretorios-$i' ..."
        mkdir "$diretorios-$i"
        echo "→ Diretório '$diretorios-$i' criado com sucesso!"
    else
        echo "Diretório '$diretorios-$i' já existe, porfavor insira outro nome."
    fi
done

cd ..
echo "______________________________________________________________"
echo "→ Processo concluído. Os subdiretórios foram criados em '$nome_diretorio'."
echo "______________________________________________________________"
