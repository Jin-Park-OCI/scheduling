%% Schedule
temp=max([size(E_schedule_hour,2),size(F_schedule_hour,2),size(G_schedule_hour,2)]);
Day=ceil(temp/hour);

Schedule_hour = zeros(3,Day*hour);
Schedule_hour(1,1:size(E_schedule_hour,2)) = E_schedule_hour;
Schedule_hour(2,1:size(F_schedule_hour,2)) = F_schedule_hour;
Schedule_hour(3,1:size(G_schedule_hour,2)) = G_schedule_hour;

E_schedule_hour = Schedule_hour(1,:);
F_schedule_hour = Schedule_hour(2,:);
G_schedule_hour = Schedule_hour(3,:);

Result_Matrix = zeros(size(VIP,1),temp+1);
Result_Matrix(:,1) = [E F G]';

Schedule_Day = zeros(size(VIP,1),Day);

% VIP(G(i),9) = ceil(find(G_schedule_hour==G(i), 1, 'last' )/hour);

% E line
for i=1:ceil(size(E_schedule_hour,2)/hour)
    if E_schedule_hour(9*i-8)==E_schedule_hour(9*i) % 하루의 시작과 끝이 같을 경우
        if E_schedule_hour(9*i-8)>0 % 하루종일 제품 1개 생산
            Schedule_Day(E_schedule_hour(9*i-8),i) = VIP(E_schedule_hour(9*i-8),6);
        end
        % 주말일 경우는 아무런 입력값 없음
    elseif E_schedule_hour(9*i-8)~=E_schedule_hour(9*i) % 하루의 시작과 끝이 다를 경우 = 하루 2제품 생산 / 생산종료
        temp=E_schedule_hour(9*i-8:9*i);
        temp=temp(temp>0);
        for k=1:size(temp,2)
            Schedule_Day(temp(k),i)=Schedule_Day(temp(k),i)+round(VIP(temp(k),6)/hour); %%%%%%%%%%%%%%%%
        end
    end
end
% F line
for i=1:ceil(size(F_schedule_hour,2)/hour)
    if F_schedule_hour(9*i-8)==F_schedule_hour(9*i) % 하루의 시작과 끝이 같을 경우
        if F_schedule_hour(9*i-8)>0 % 하루종일 제품 1개 생산
            Schedule_Day(F_schedule_hour(9*i-8),i) = VIP(F_schedule_hour(9*i-8),6);
        end
        % 주말일 경우는 아무런 입력값 없음
    elseif F_schedule_hour(9*i-8)~=F_schedule_hour(9*i) % 하루의 시작과 끝이 다를 경우 = 하루 2제품 생산 / 생산종료
        temp=F_schedule_hour(9*i-8:9*i);
        temp=temp(temp>0);
        for k=1:size(temp,2)
            Schedule_Day(temp(k),i)=Schedule_Day(temp(k),i)+round(VIP(temp(k),6)/hour); %%%%%%%%%%%%%%%%
        end
    end
end
% G line
for i=1:ceil(size(G_schedule_hour,2)/hour)
    if G_schedule_hour(9*i-8)==G_schedule_hour(9*i) % 하루의 시작과 끝이 같을 경우
        if G_schedule_hour(9*i-8)>0 % 하루종일 제품 1개 생산
            Schedule_Day(G_schedule_hour(9*i-8),i) = VIP(G_schedule_hour(9*i-8),6);
        end
        % 주말일 경우는 아무런 입력값 없음
    elseif G_schedule_hour(9*i-8)~=G_schedule_hour(9*i) % 하루의 시작과 끝이 다를 경우 = 하루 2제품 생산 / 생산종료
        temp=G_schedule_hour(9*i-8:9*i);
        temp=temp(temp>0);
        for k=1:size(temp,2)
            Schedule_Day(temp(k),i)=Schedule_Day(temp(k),i)+round(VIP(temp(k),6)/hour); %%%%%%%%%%%%%%%%
        end
    end
end

% 일일생산량 및 Scale 양 계산
[temp, temp2] = size(Schedule_Day);
Result_Day = zeros(2,temp2);

temp_scrap = zeros(size([E F G],2),2);
temp_scrap(:,1)=[E F G]';
for i=1:size(E,2)
    temp_scrap(i,2)=VIP_scrap(E(i),9);
end
for i=1:size(F,2)
    temp_scrap(size(E,2)+i,2)=min(VIP_scrap(F(i),14),VIP_scrap(F(i),19));
end
for i=1:size(G,2)
    temp_scrap(size(E,2)+size(F,2)+i,2)=min(VIP_scrap(G(i),14),VIP_scrap(G(i),19));
end
temp_scrap = sortrows(temp_scrap,1);

for i=1:temp2
    Result_Day(1,i) = sum(Schedule_Day(:,i)); % 일일생산량 합계
    for j=1:temp
        if Schedule_Day(j,i)>0
            Result_Day(2,i) = Result_Day(2,i)+Schedule_Day(j,i)*temp_scrap(j,2);
        end
    end
end

Schedule_Day_row = Schedule_Day;

% 생산순서에 맞게 정렬 (E, F, G)
temp = Schedule_Day;
temp2 = [E F G];
for i=1:size(temp2',1)
    Schedule_Day(i,:) = temp(temp2(i),:);
end


%{
for i=1:3
   for j=1:Result_Matrix
       if Schedule_hour(i,j)>0
       [b, ~]=find(Result_Matrix(:,1)==Schedule_hour(i,j));
       Result_Matrix(b,j+1)=Schedule_hour(i,j);
       
       elseif Schedule_hour(i,j) == -1
           Result_Matrix(i,j+1)=Schedule_hour(i,j)
               
       
   end
end
%}