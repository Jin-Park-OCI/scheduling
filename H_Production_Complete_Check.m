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
% ���⿩���� - ����Ϸ��� (������ ������ ���⸦ ������ ���� ��)
temp=(VIP(:,7)-VIP(:,9))';
for i=1:size(temp,2)
    day_check(i) = temp(i)<0;
end
temp=[];

if sum(day_check)>0
    fprintf('# ����ȭ ��� : 1�� �̻��� ��ǰ�� ������ؿ� �������� ���߽��ϴ�.\n\n')
    day_check
else
    fprintf('# ����ȭ ��� : ��� ��ǰ�� ������ؿ� �����Ͽ����ϴ�.\n\n')
end