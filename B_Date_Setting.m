%% �޷� ǥ��
% �Է� �κ� %
% ��¥ ��� �κ� %
ed_month=[31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; %���� �� �ϼ�, 2���� �����̹Ƿ� �� �⵵���� �Ʒ� ���ǿ� ���� ����, for ���� ������ ���� ed_month�� �ᱹ year�⵵�� ���� �ϼ��� �ȴ�.

for roop_y=1:1:Y %roop_y�� 1����� year����� 1�� ����
    if ~(rem(roop_y,4)==0 && rem(roop_y,100)==0 || ~rem(roop_y,4)==0) %������ 1(��), ����� 0(����)
        ed_month(2)=29; %������ �� 2���� �� �ϼ��� 29��%
    else
        ed_month(2)=28; %����� �� 2���� �� �ϼ��� 28��%
    end
    total_d1(roop_y)=sum(ed_month); %total_d1�� year�� 12�� 31�ϱ����� �� �ϼ�
end
total_d=sum(total_d1)-sum(ed_month(M:12)); %total_d�� year�� month�� ���� 12�������� ������ ���ֹǷ� year�� month���� �� �ϼ��� �ȴ�.
week = rem(total_d,7); %year�� month���� 1���� ������������ ��Ÿ��. 1=��, 2=��, 3=ȭ.., 0=��

% ȭ�鱸���κ� %
result=zeros(5,7);
index=1:ed_month(M);
if week==0 % �ݺ��� ó���� ���� 0�� ���ֱ�
    week=7; % 0(=�����)�� 7�� �ٲ��.
end

array = [ NaN*ones(1,week-1) 1:ed_month(M) NaN*ones(1,42-(week-1)-ed_month(M)) ];
result = reshape(array,7,6)';
[~, b]=find(D==result);
DOW = b-1;