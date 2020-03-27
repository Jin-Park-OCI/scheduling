%% Production Complete Date Check
for i=1:size(E,2)
    VIP(E(i),9) = ceil(find(E_schedule_hour==E(i), 1, 'last' )/hour);
end
for i=1:size(F,2)
    VIP(F(i),9) = ceil(find(F_schedule_hour==F(i), 1, 'last' )/hour);
end
for i=1:size(G,2)
    VIP(G(i),9) = ceil(find(G_schedule_hour==G(i), 1, 'last' )/hour);
end
% 납기여유일 - 생산완료일 (음수가 나오면 납기를 맞추지 못한 것)
temp=(VIP(:,7)-VIP(:,9))';
for i=1:size(temp,2)
    day_check(i) = temp(i)<0;
end
temp=[];

if sum(day_check)>0
    fprintf('# 최적화 결과 : 1개 이상의 제품이 납기기준에 만족하지 못했습니다.\n\n')
    day_check
else
    fprintf('# 최적화 결과 : 모든 제품이 납기기준에 만족하였습니다.\n\n')
end