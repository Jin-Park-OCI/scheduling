%% Scheduling Matrix
E_schedule = [];
F_schedule = [];
G_schedule = [];
E_schedule_hour = [];
F_schedule_hour = [];
G_schedule_hour = [];

% 생산스케줄 일(day)/시간(hour)별로 나열
for i=1:size(E,2)
    [~, b]=find(VIP_day_list(:,1)'==E(i));
    E_schedule = [E_schedule E(i)*ones(1,VIP_day_list(b,2))];
    E_schedule_hour = [E_schedule_hour E(i)*ones(1,VIP_day_list(b,3))];
end
for i=1:size(F,2)
    [~, b]=find(VIP_day_list(:,1)'==F(i));
    b=b(1);
    F_schedule = [F_schedule F(i)*ones(1,VIP_day_list(b,2))];
    F_schedule_hour = [F_schedule_hour F(i)*ones(1,VIP_day_list(b,3))];
end
for i=1:size(G,2)
    [~, b]=find(VIP_day_list(:,1)'==G(i));
    b=b(1);
    G_schedule = [G_schedule G(i)*ones(1,VIP_day_list(b,2))];
    G_schedule_hour = [G_schedule_hour G(i)*ones(1,VIP_day_list(b,3))];
end

% VIP 두께 변경시 생산불가 시간 적용 (3hr)
k=size(E_schedule_hour,2);
for i=1:k-1
    if VIP(E_schedule_hour(k-i+1),4)~=VIP(E_schedule_hour(k-i),4)
        E_schedule_hour = [E_schedule_hour(1:k-i) -100 -100 -100 E_schedule_hour(k-i+1:k)];
    end
end
k=size(F_schedule_hour,2);
for i=1:k-1
    if VIP(F_schedule_hour(k-i+1),4)~=VIP(F_schedule_hour(k-i),4)
        F_schedule_hour = [F_schedule_hour(1:k-i) -100 -100 -100 F_schedule_hour(k-i+1:k)];
    end
end
k=size(G_schedule_hour,2);
for i=1:k-1
    if VIP(G_schedule_hour(k-i+1),4)~=VIP(G_schedule_hour(k-i),4)
        G_schedule_hour = [G_schedule_hour(1:k-i) -100 -100 -100 G_schedule_hour(k-i+1:k)];
    end
end
