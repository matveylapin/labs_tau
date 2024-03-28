clc;
clear all;
close all;

tic;                                    % запуск секундомера

XMAX = 5;                               % размер сетки рисования
XMIN = -5
STEP = 0.5;                             % шаг сетки
TMAX = 10;                              % время моделирования
MAINSYSNAME = "DemoLaboratory";         % название модели
SUBSYSNAME = "variantGrad";               % название подмодели


simInitSet(TMAX, MAINSYSNAME, SUBSYSNAME);                  % инициализация параметров системы
plotLocus(XMAX, XMIN, STEP, MAINSYSNAME, SUBSYSNAME);             % построение фазовых портретов

toc;                                    % остановка секундомера
