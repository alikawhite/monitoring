#!/bin/bash

read -p "Введите маску, нижнее подчёркивание и дату по шаблону: az_200622    " mask
find / -name "*$mask" -delete