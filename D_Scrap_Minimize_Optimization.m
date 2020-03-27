%% Scrap Min. Optimization_Prepare
Order = VIP_line(:,1)';
for i=1:m
    if VIP_line(i,5)==1
        SMO(1,i)=VIP_line(i,1);
    else
        SMO(2,i)=VIP_line(i,1);
    end
end

% if E_fix~=[]
    E = E_fix;
% end
% if F_fix~=[]
    F = F_fix;
% end
% if G_fix~=[]
    G = G_fix;
% end

E = [E nonzeros(SMO(1,:))'];
E = intersect(Order,E,'stable');

% Produce time calculate (E)
for i=1:size(E,2)
    temp=VIP_day(:,1)';
    [~, b]=find(VIP_scrap(:,1)'==E(i));
    E_day(i) = VIP_day(b,5);
end

% % Produce time calculate (F, G line)
SMO_F = nonzeros(SMO(2,:))';
SMO_F = setdiff(SMO_F,E);
SMO_F = setdiff(SMO_F,F);
SMO_F = setdiff(SMO_F,G);

% Produce time calculate (F, G)
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

for i=1:size(SMO_F,2)
    temp=VIP_day(:,1)';
    [~, b]=find(VIP_scrap(:,1)'==SMO_F(i));
    b=b(1);
    SMO_F_day(i) = VIP_day(b,5);
end

for i=1:size(SMO_F,2)
    if sum(F_day) > sum(G_day)
        G = [G SMO_F(i)];
        G_day = [G_day SMO_F_day(i)];
    else
        F = [F SMO_F(i)];
        F_day = [F_day SMO_F_day(i)];
    end
end