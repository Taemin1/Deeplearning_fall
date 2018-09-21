%a = importdata('C:/falldeteciton_hot.csv');
ACTIVITY = csvread('C:/falldeteciton.csv',1,0, [ 1 0 10000 0]);
TIME = csvread('C:/falldeteciton.csv',1,1, [ 1 1 10000 1]);
SL = csvread('C:/falldeteciton.csv',1,2, [ 1 2 10000 2]);
EEG = csvread('C:/falldeteciton.csv',1,3, [ 1 3 10000 3]);
BP = csvread('C:/falldeteciton.csv',1,4, [ 1 4 10000 4]);
HR = csvread('C:/falldeteciton.csv',1,5, [ 1 5 10000 5]);
CIRCLUATION = csvread('C:/falldeteciton.csv',1,6, [ 1 6 10000 6]);

% ACTIVITY = csvread('C:/falldeteciton.csv',1,0, [ 1 0 50 0]);
% TIME = csvread('C:/falldeteciton.csv',1,1, [ 1 1 50 1]);
% SL = csvread('C:/falldeteciton.csv',1,2, [ 1 2 50 2]);
% EEG = csvread('C:/falldeteciton.csv',1,3, [ 1 3 50 3]);
% BP = csvread('C:/falldeteciton.csv',1,4, [ 1 4 50 4]);
% HR = csvread('C:/falldeteciton.csv',1,5, [ 1 5 50 5]);
% CIRCLUATION = csvread('C:/falldeteciton.csv',1,6, [ 1 6 50 6]);
