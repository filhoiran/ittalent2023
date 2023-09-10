#!/usr/bin/bash

<<'--COMENTARIO--'
Questão 1 - Contagem de palavras *
Crie um Shell Script que faça a contagem de quantas palavras existem dentro de um arquivo de texto.
Dica: Utilize o comando wc com suas sintaxes do linux
--COMENTARIO--

# path to the file
##file_path="/home/em003157/arquivo.txt"

read -p "Digite o caminho onde está o arquivo: " file_path

# Counting words
#words=$(echo -n "$file_path" | wc -w)
words=$(wc -w < "$file_path")

# using wc command to count number of lines
##number_of_lines=`wc --lines < $file_path`

# using wc command to count number of words
##number_of_words=`wc --word < $file_path`

# Displaying number of lines and number of words
echo "_________________________________"
echo "→ Número de palavras: $words"
##echo "Número de linhas: $number_of_lines"
##echo "Número de letras: $number_of_words"
echo "_________________________________"
