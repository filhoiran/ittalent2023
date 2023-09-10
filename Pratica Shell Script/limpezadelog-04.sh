#!/bin/bash

<<'--COMENTARIO--'
Questão 4 - Limpeza de Log *
Crie um Shell Script que remove todos os arquivos do tipo .log que estejam
com mais de 7 dias de atividade dentro do diretório /var/log.
Obs: Para essa questão não precisa do uso do crontab.
Dica: É possível realizar a verificação de dias através do atributo -mtime do comando find.
--COMENTARIO--

# Diretório padrão onde os arquivos .log serão procurados
Fpath_logs="/var/log"

# Encontra e remove os arquivos .log com mais de 7 dias
find "$Fpath_logs" -type f -name "*.log" -mtime +7 -exec rm -rf {} \; </dev/null

echo "———————————————————————————————————"
echo "Limpeza dos arquivos de log concluída!"
echo "➔ Arquivos .log com mais de 7 dias de atividade foram APAGADOS."
echo "———————————————————————————————————"
