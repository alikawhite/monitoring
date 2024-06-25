#!/bin/bash

number=$((100 + $RANDOM % 1000))
sudo rm -rf l* 2> /dev/null
errcodes="200 201 400 401 403 404 500 501 502 503"
methods="GET POST PUT PATCH DELETE"

errcode=($errcodes)
method=($methods)
agent=($agents)
num_errcodes=${#errcode[*]} 
num_methods=${#method[*]}
for ((j = 1; j <= 5; j++))
do
    start_date="2000-01-01"
    random_sec=$(shuf -i 1-693792000 -n 1)
    random_date=$(date -d "$start_date + $random_sec sec" +%Y-%m-%d)
    for ((i = 0; i < $number; i++))
    do 
        ip=$((1 + $RANDOM % 255))
        adress=$ip'.'
        for ((m = 1; m < 4; m++))
        do
            ip=$((0 + $RANDOM % 255))
            adress="$adress$ip"
            if [[ m -lt 3 ]]; then
                adress="$adress."
            fi
        done

        err="${errcode[$((RANDOM%num_errcodes))]} "
        meth="${method[$((RANDOM%num_methods))]} "
        number_browser=$(( $RANDOM % 7 + 0 ))
        browser=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge"
        "Crawler and bot" "Library and net tool")
        result_browser=${browser[$number_browser]}
        number_protocol=$(( $RANDOM % 3 + 0 ))
        protocol=("HTTP/0.9" "HTTP/1.0" "HTTP/1.1" "HTTP/2.0")
        protocol_result=${protocol[$number_protocol]}
        size=$((100 + $RANDOM % 1000))

        if [[ $i == 1 ]];then
        random_s=0
        else
            random_s=$(shuf -i 1-86 -n 1)
            (( sec_random+=$random_s ))
            date=$(date -d "$random_date + $sec_random sec" +%d/%b/%Y:%H:%M:%S)
            echo "$adress - - [$date" +0000"] \"$meth/ $protocol_result\" $err$size \"-\" \"$result_browser\"" >> 'l'$j'.log'
        fi
    done
done

# "200" "Успешно". Запрос успешно обработан.
# "201" "Создано". Запрос успешно выполнен и в результате был создан ресурс. 
# "400" "Плохой запрос". Этот ответ означает, что сервер не понимает запрос из-за неверного синтаксиса. 
# "401" "Неавторизованно". Для получения запрашиваемого ответа нужна аутентификация.
# "403" "Запрещено". У клиента нет прав доступа к содержимому, поэтому сервер отказывается дать надлежащий ответ. 
# "404" "Не найден". Сервер не может найти запрашиваемый ресурс. 
# "500" "Внутренняя ошибка сервера". Сервер столкнулся с ситуацией, которую он не знает как обработать. 
# "501" "Не выполнено". Метод запроса не поддерживается сервером и не может быть обработан.
# "502" "Плохой шлюз". Во время работы в качестве шлюза для получения ответа, нужного для обработки запроса, получил недействительный (недопустимый) ответ. 
# "503" "Сервис недоступен". Сервер не готов обрабатывать запрос. 

