%% 생산 line 지정
% E
if E_fix>0
    for i=1:size(E_fix,2)
        temp=find(F==E_fix(i));
        if temp>0
            F(temp)=[];
            E = [E E_fix(i)];
            E = intersect(Production_Order',E,'stable');
        end
        temp=find(G==E_fix(i));
        G(temp)=[];
        E = [E E_fix(i)];
        E = intersect(Production_Order',E,'stable');
    end
end

% F
if F_fix>0
    for i=1:size(F_fix,2)
        temp=find(E==F_fix(i));
        if temp>0
            E(temp)=[];
            F = [F F_fix(i)];
            F = intersect(Production_Order',F,'stable');
        end
        temp=find(G==F_fix(i));
        G(temp)=[];
        F = [F F_fix(i)];
        F = intersect(Production_Order',F,'stable');
    end
end

% G
if G_fix>0
    for i=1:size(G_fix,2)
        temp=find(E==G_fix(i));
        if temp>0
            E(temp)=[];
            G = [G G_fix(i)];
            G = intersect(Production_Order',G,'stable');
        end
        temp=find(F==G_fix(i));
        F(temp)=[];
        G = [G G_fix(i)];
        G = intersect(Production_Order',G,'stable');
    end
end

% Produce time calculate (SMO_day)
E_day=[];
for i=1:size(E,2)
    temp=VIP_day(:,1)';
    [~, b]=find(VIP_scrap(:,1)'==E(i));
    E_day(i) = VIP_day(b,5);
end

F_day=[];
for i=1:size(F,2)
    temp=VIP_day(:,1)';
    [~, b]=find(VIP_scrap(:,1)'==F(i));
    F_day(i) = VIP_day(b,5);
end

G_day=[];
for i=1:size(G,2)
    temp=VIP_day(:,1)';
    [~, b]=find(VIP_scrap(:,1)'==G(i));
    G_day(i) = VIP_day(b,5);
end