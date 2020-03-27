%% Thickness & Optimal Produce Order Calculate
% E = [5 8];
% F = [7 10 3 11 9];
% G = [6 1 4 2];

for ii=1:size(E,2)
    E_thickness(ii) = VIP(E(ii),4);
end
if size(E,2)>2 % 서로 다른 제품이 3개 이상이어야 가능
    for ii=1:size(E,2)-2
        for jj=ii+1:size(E,2)
            if E_thickness(ii)~=E_thickness(jj)
                continue
            end
            E_switch=E(jj);
            E_switch_thickness=E_thickness(jj);
            
            E_temp=E;
            E_thickness_temp=E_thickness;
            E(jj)=[];
            E_thickness(jj)=[];
            
            E=[E(1:ii) E_switch E(ii+1:size(E,2))];
            E_thickness = [E_thickness(1:ii) E_switch_thickness E_thickness(ii+1:size(E_thickness,2))];
            
            F_Scheduling_Matrix
            % G_Weekend_Application
            for k=1:size(E,2)
                VIP(E(k),9) = ceil(find(E_schedule_hour==E(k), 1, 'last' )/hour);
            end
            temp=(VIP(:,7)-VIP(:,9))';
            for l=1:size(temp,2)
                day_check(l) = temp(l)<0;
            end
            if sum(day_check)==0 % 납기에 문제 없음
                break
            end
            if sum(day_check)~=0 %납기 못맞춤
                E=E_temp;
                E_thickness=E_thickness_temp;
            end
        end
    end
end
%}

% F line
for ii=1:size(F,2)
    F_thickness(ii) = VIP(F(ii),4);
end
if size(F,2)>2 % 서로 다른 제품이 3개 이상이어야 가능
    for ii=1:size(F,2)-2
        for jj=ii+1:size(F,2)
            if F_thickness(ii)~=F_thickness(jj)
                continue
            end
            F_switch=F(jj);
            F_switch_thickness=F_thickness(jj);
            
            F_temp=F;
            F_thickness_temp=F_thickness;
            F(jj)=[];
            F_thickness(jj)=[];
            
            F=[F(1:ii) F_switch F(ii+1:size(F,2))];
            F_thickness = [F_thickness(1:ii) F_switch_thickness F_thickness(ii+1:size(F_thickness,2))];
            
            F_Scheduling_Matrix
            % G_Weekend_Application
            for k=1:size(F,2)
                VIP(F(k),9) = ceil(find(F_schedule_hour==F(k), 1, 'last' )/hour);
            end
            temp=(VIP(:,7)-VIP(:,9))';
            for l=1:size(temp,2)
                day_check(l) = temp(l)<0;
            end
            if sum(day_check)==0 % 납기에 문제 없음
                break
            end
            if sum(day_check)~=0 %납기 못맞춤
                F=F_temp;
                F_thickness=F_thickness_temp;
            end
        end
    end
end


% G line
for ii=1:size(G,2)
    G_thickness(ii) = VIP(G(ii),4);
end
if size(G,2)>2 % 서로 다른 제품이 3개 이상이어야 가능
    for ii=1:size(G,2)-2
        for jj=ii+1:size(G,2)
            if G_thickness(ii)~=G_thickness(jj)
                continue
            end
            G_switch=G(jj);
            G_switch_thickness=G_thickness(jj);
            
            G_temp=G;
            G_thickness_temp=G_thickness;
            G(jj)=[];
            G_thickness(jj)=[];
            
            G=[G(1:ii) G_switch G(ii+1:size(G,2))];
            G_thickness = [G_thickness(1:ii) G_switch_thickness G_thickness(ii+1:size(G_thickness,2))];
            
            F_Scheduling_Matrix
            % G_Weekend_Application
            for k=1:size(G,2)
                VIP(G(k),9) = ceil(find(G_schedule_hour==G(k), 1, 'last' )/hour);
            end
            temp=(VIP(:,7)-VIP(:,9))';
            for l=1:size(temp,2)
                day_check(l) = temp(l)<0;
            end
            if sum(day_check)==0 % 납기에 문제 없음
                break
            end
            if sum(day_check)~=0 %납기 못맞춤
                G=G_temp;
                G_thickness=G_thickness_temp;
            end
        end
    end
end

