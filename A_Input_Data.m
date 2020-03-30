%% Input data
% VIP size & production amount & rate input
clear;clc
close all


Y = year(datetime);
M = month(datetime);
D = 10; % day(datetime);
hour = 9;

% DOW = 1 ; % Day of the week
% 1 = Mon, 2 = Tues, 3 = Wed, 4 = Thur, 5 = Fri

% 2019�� 4��
%{
VIP=[1 216 876 12 5000 1500 19; % 35 ->12
    2 475 690 25 8000 650 45;
    3 400 620 25 3132 1600 17;
    4 475 690 25 9800 1400 18;
    5 440 630 32 17620 1300 55;
    6 400 620 20 2400 1200 12;
    7 475 690 25 6700 1000 40;
    8 155 275 5 8378 1400 44;
    9 216 343 25 8075 900 43;
    10 200 300 12 7320 2800 34;
    11 200 300 12 8913 1800 55
    12 300 1000 40 1168 500 80
    13 600 600 40 330 300 75
    14 216 343 35 2400 800 64];
%}

%VIP=xlsread('Excel-MATLAB.xlsx','VIP','F4:K103');
VIP = readmatrix('Excel-MATLAB.xlsx','Sheet','VIP','Range','F4:K103');
VIP=[zeros(size(VIP,1),1) VIP];
for i=1:size(VIP,1)
   VIP(i,1) = i;
end

% ����Ϸ�� ��� �о����
%VIP_prod = xlsread('Excel-MATLAB.xlsx','VIP','N4:BW103'); % ��ü Excel ���ǥ �б�
VIP_prod = readmatrix('Excel-MATLAB.xlsx','Sheet','VIP','Range','N4:BW103');

%Today_No = D % find(temp==exceltime(datetime('today','Format','MM/dd')));
VIP_prod(size(VIP_prod,1)-1:size(VIP_prod,1),:) = []; % ���ϻ��귮, scrap���� �����
VIP_prod = VIP_prod(2:size(VIP_prod,1),1:D-1); % ���ó�¥ ���� �Ϸ� �������� ����� ����
for i=1:size(VIP_prod,1)
    VIP_prod_sum(i,1) = sum(VIP_prod(i,1:size(VIP_prod,2))); % VIP ��ǰ���� ���귮 �հ�
end
%xlswrite('Excel-MATLAB.xlsx',VIP_prod_sum,'VIP','L4') % ���ϱ����� ���귮 �հ� Excel�� ����
writematrix(VIP_prod_sum,'Excel-MATLAB.xlsx','Sheet','VIP','Range','L4');

% ��û�������� �������귮�� ������ ��
%{
for i=1:size(VIP,1)
   VIP(i,5) = VIP(i,5)-VIP_prod_sum(i,1);
   if VIP(i,5) < 0
       VIP(i,5) = 0;
   end
end
%}

% ���� line ���� �Է�
%Line_fix=xlsread('Excel-MATLAB.xlsx','VIP','E3:E103');  
Line_fix=readmatrix('Excel-MATLAB.xlsx', 'Sheet','VIP','Range','E3:E103');
Line_fix(1,:)=[];
Line_fix(isnan(Line_fix))=0;
E_fix=[]; F_fix=[]; G_fix=[];
for i=1:size(Line_fix,1)
    if Line_fix(i)==1
        E_fix = [E_fix i];
    elseif Line_fix(i)==2
        F_fix = [F_fix i];
    elseif Line_fix(i)==3
        G_fix = [G_fix i];
    end
end

% E_fix = [2];
% F_fix = [13];
% G_fix = [12];

VIP = rmmissing(VIP);
[m, n] = size(VIP);