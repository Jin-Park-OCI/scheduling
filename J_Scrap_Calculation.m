%% Scrap Calculation
temp=VIP_scrap(:,1);
for i=1:length(E)
    [b,~]=find(temp==E(i));
    E_scrap(i)=VIP_scrap(b,9)*VIP_sort(b,5);
end
for i=1:length(F)
    [b,~]=find(temp==F(i));
    b=b(1);
    F_scrap(i)=VIP_scrap(b,14)*VIP_sort(b,5);
end
for i=1:length(G)
    [b,~]=find(temp==G(i));
    b=b(1);
    G_scrap(i)=VIP_scrap(b,14)*VIP_sort(b,5);
end

sum([sum(E_scrap) sum(F_scrap) sum(G_scrap)])

[E;E_day]
[F;F_day]
[G;G_day]