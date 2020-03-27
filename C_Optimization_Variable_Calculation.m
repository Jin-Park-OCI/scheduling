%% Optimization variable calculation
% 납기일이 빠른것부터 느린순으로 나열
VIP_sort=sortrows(VIP,7);
Production_Order=VIP_sort(:,1);

% 생산소요일수 계산
VIP_day = VIP_sort(:,1:4);
for i=1:m
    VIP(i,8)=ceil(VIP(i,5)/VIP(i,6));
    VIP_day(i,5)=ceil(VIP_sort(i,5)/VIP_sort(i,6));
    VIP_day(i,6)=ceil(VIP_sort(i,5)/(VIP_sort(i,6)/hour));
end

% 제품 넓이 계산
VIP_size = VIP_sort(:,1:4);
for i=1:m
    VIP_size(i,5)=VIP_sort(i,2)*VIP_sort(i,3)/1000000;
end

% Line별 scrap 발생량 계산
VIP_scrap=VIP_sort(:,1:4);
waste = 50;
for i=1:m
    VIP_scrap(i,5)=floor((1250-waste)/VIP_scrap(i,2)); % E line (1,250x1,250)
    VIP_scrap(i,6)=floor(1250/VIP_scrap(i,3));
    VIP_scrap(i,7)=VIP_scrap(i,5)*VIP_scrap(i,6);
    VIP_scrap(i,8)=(1.25*1.25)-(VIP_size(i,2)*VIP_size(i,3)*VIP_scrap(i,7)/1000000);
    VIP_scrap(i,9)=VIP_scrap(i,8)/VIP_scrap(i,7); % 제품 1개당 scrap 발생량 (scrap/EA)
    
    VIP_scrap(i,10)=floor((1400-waste)/VIP_scrap(i,2)); % F,G line (1,400x1,700)
    VIP_scrap(i,11)=floor(1700/VIP_scrap(i,3));
    VIP_scrap(i,12)=VIP_scrap(i,10)*VIP_scrap(i,11);
    VIP_scrap(i,13)=(1.4*1.7)-(VIP_size(i,2)*VIP_size(i,3)*VIP_scrap(i,12)/1000000)*0.999;
    % Scrap양의 같은 값 방지를 위한 0.999 곱하기
    VIP_scrap(i,14)=VIP_scrap(i,13)/VIP_scrap(i,12);
    
    
    VIP_scrap(i,15)=floor((1700-waste)/VIP_scrap(i,2)); % F,G line (1,700x1,400)
    VIP_scrap(i,16)=floor(1400/VIP_scrap(i,3));
    VIP_scrap(i,17)=VIP_scrap(i,15)*VIP_scrap(i,16);
    VIP_scrap(i,18)=(1.4*1.7)-(VIP_size(i,2)*VIP_size(i,3)*VIP_scrap(i,17)/1000000);
    VIP_scrap(i,19)=VIP_scrap(i,18)/VIP_scrap(i,17);
end

% Decide optimum production line (1st, 2nd, 3rd)

VIP_line=VIP_sort(:,1:4);

for i=1:m
    VIP_line(i,7)=min([VIP_scrap(i,9),VIP_scrap(i,14),VIP_scrap(i,19)]); % Scrap 최솟값
    [~, b]=find(VIP_scrap==VIP_line(i,7));
    b=b(1);
    VIP_line(i,5)=(b-4)/5; % 최적 생산 line (1,2,3)
    VIP_line(i,6)=VIP_scrap(i,b-2); % Module 1개에서 생산되는 제품 개수
    
    
    VIP_line(i,10)=median([VIP_scrap(i,9),VIP_scrap(i,14),VIP_scrap(i,19)]); % Scrap 중간값
    [~, b]=find(VIP_scrap==VIP_line(i,10));
    b=b(1);
    VIP_line(i,8)=(b-4)/5;
    VIP_line(i,9)=VIP_scrap(i,b-2);
    
    VIP_line(i,13)=max([VIP_scrap(i,9),VIP_scrap(i,14),VIP_scrap(i,19)]); % Scrap 최댓값
    [~, b]=find(VIP_scrap==VIP_line(i,13));
    b=b(1);
    VIP_line(i,11)=(b-4)/5;
    VIP_line(i,12)=VIP_scrap(i,b-2);
    
    VIP_size(i,6)=VIP_line(i,5);
    VIP_size(i,7)=VIP_line(i,6);
    VIP_size(i,8)=VIP_line(i,7);
end

VIP_day_list = [VIP_day(:,1) VIP_day(:,5) VIP_day(:,6)];