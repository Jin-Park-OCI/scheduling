%% 달력 표현
% 입력 부분 %
% 날짜 계산 부분 %
ed_month=[31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; %월별 총 일수, 2월은 윤달이므로 각 년도마다 아래 조건에 따라 결정, for 문을 지나고 나면 ed_month는 결국 year년도의 월별 일수가 된다.

for roop_y=1:1:Y %roop_y는 1년부터 year년까지 1씩 증가
    if ~(rem(roop_y,4)==0 && rem(roop_y,100)==0 || ~rem(roop_y,4)==0) %윤년은 1(참), 평년은 0(거짓)
        ed_month(2)=29; %윤년일 때 2월의 총 일수는 29일%
    else
        ed_month(2)=28; %평년일 때 2월의 총 일수는 28일%
    end
    total_d1(roop_y)=sum(ed_month); %total_d1은 year년 12월 31일까지의 총 일수
end
total_d=sum(total_d1)-sum(ed_month(M:12)); %total_d는 year년 month월 부터 12월까지의 날수를 빼주므로 year년 month월의 총 일수가 된다.
week = rem(total_d,7); %year년 month월의 1일이 무슨요일인지 나타냄. 1=일, 2=월, 3=화.., 0=토

% 화면구성부분 %
result=zeros(5,7);
index=1:ed_month(M);
if week==0 % 반복문 처리를 위해 0을 없애기
    week=7; % 0(=토요일)을 7로 바뀐다.
end

array = [ NaN*ones(1,week-1) 1:ed_month(M) NaN*ones(1,42-(week-1)-ed_month(M)) ];
result = reshape(array,7,6)';
[~, b]=find(D==result);
DOW = b-1;