#!/bin/bash

<<'--COMENTARIO--'
Questão 5 - Calculadora *
Fazendo o uso de funções desenvolva uma calculadora que realize as seguintes operações:
Adição (+)
Subtração (-)
Multiplicação (*)
Divisão (/)
O Shell Script quando executado deve conter um menu para digitar a opção de operação matemática desejada.
--COMENTARIO--

## sudo apt install bc #Debian/Ubuntu
## sudo yum install bc  #RHEL/CentOS
## sudo dnf install bc  #Fedora 22+

# Função para realizar a operação de adição:
function addition() {
   resultado=$(echo "$1 + $2" | bc)
   #resultado=$(( "$1 + $2" ))
   echo -e "\n→ Resultado: $num1 + $num2 = $resultado ←"
}

# Função para realizar a operação de subtração
function subtracao() {
   resultado=$(echo "$1 - $2" | bc)
   #resultado=$(( "$1 - $2" ))
   echo -e "\n→ Resultado: $num1 - $num2 = $resultado ←"
}

# Função para realizar a operação de multiplicação
function multiplicacao() {
   resultado=$(echo "$1 * $2" | bc)
   #resultado=$(( "$1 * $2" ))
   echo -e "\n→ Resultado: $num1 * $num2 = $resultado ←"
}

# Função para realizar a operação de divisão
function divisao() {
    if [ "$2" -eq 0 ]; then
        echo -e "\nErro: Divisão por zero não permitida."
    else
        resultado=$(echo "scale=2; $1 / $2" | bc)
        echo -e "\n→ Resultado: $num1 / $num2 = $resultado ←"
    fi
}

       # Menu
while true; do
echo -e "\n·················CALCULADORA·················"
        echo ".————————————————————————."
        echo "|--> [1] Somar (+)       |"
        echo "|--> [2] Subtrair (-)    |"
        echo "|--> [3] Multiplicar (*) |"
        echo "|--> [4] Dividir (/)     |"
        echo "|--> [5] Sair / Finish   |"
        echo "'————————————————————————'"
echo "··············································"

       # Solicitando a operação matemática
       read -p "Escolha a operação que você deseja executar [1 - 2 - 3 - 4 - 5] : " operacao

    case $operacao in
        1)  # Adição
            echo "«Somar»"
            echo -n "• Digite o primeiro número: "; read num1
            echo -n "• Digite o segundo número: "; read num2
            addition "$num1" "$num2"
            ;;
        2)  # Subtração
            echo "«Diminuir»"
            echo -n "• Digite o primeiro número: "; read num1
            echo -n "• Digite o segundo número: "; read num2
            subtracao "$num1" "$num2"
            ;;
        3)  # Multiplicação
            echo "«Multiplicar»"
            echo -n "• Digite o primeiro número: "; read num1
            echo -n "• Digite o segundo número: "; read num2
            multiplicacao "$num1" "$num2"
            ;;
        4)  # Divisão
            echo "«Dividir»"
            echo -n "• Digite o primeiro número: "; read num1
            echo -n "• Digite o segundo número: "; read num2
            divisao "$num1" "$num2"
            ;;
        5)  # Sair
            echo "———————————————————————————————————"
            echo "→ Saindo da calculadora. Obrigado, volte sempre! ¯\_(ツ)_/¯"
            echo "———————————————————————————————————"
            exit 0
            ;;
        *)
            echo "Opção inválida."
            ;;
    esac
done
