%% Production Able Transform

% E_line
temp=fix(size(E_schedule_hour,2)/9);
for i=1:temp
    if E_schedule_hour(9*i-8) == -100
        E_schedule_hour(9*i-8) = E_schedule_hour(9*i-7);
        if E_schedule_hour(9*i-7) == -100
            E_schedule_hour(9*i-7) = E_schedule_hour(9*i-6);
            E_schedule_hour(9*i-8) = E_schedule_hour(9*i-7);
            if E_schedule_hour(9*i-6) == -100
                E_schedule_hour(9*i-6) = E_schedule_hour(9*i-5);
                E_schedule_hour(9*i-7) = E_schedule_hour(9*i-6);
                E_schedule_hour(9*i-8) = E_schedule_hour(9*i-7);
            end
        end
    end
end
for i=1:temp
    if E_schedule_hour(9*i) == -100
        E_schedule_hour(9*i) = E_schedule_hour(9*i-1);
        if E_schedule_hour(9*i-1) == -100
            E_schedule_hour(9*i-1) = E_schedule_hour(9*i-2);
            E_schedule_hour(9*i) = E_schedule_hour(9*i-1);
            if E_schedule_hour(9*i-2) == -100
                E_schedule_hour(9*i-2) = E_schedule_hour(9*i-3);
                E_schedule_hour(9*i-1) = E_schedule_hour(9*i-2);
                E_schedule_hour(9*i) = E_schedule_hour(9*i-1);
            end
        end
    end
end

% F_line
temp=fix(size(F_schedule_hour,2)/9);
for i=1:temp
    if F_schedule_hour(9*i-8) == -100
        F_schedule_hour(9*i-8) = F_schedule_hour(9*i-7);
        if F_schedule_hour(9*i-7) == -100
            F_schedule_hour(9*i-7) = F_schedule_hour(9*i-6);
            F_schedule_hour(9*i-8) = F_schedule_hour(9*i-7);
            if F_schedule_hour(9*i-6) == -100
                F_schedule_hour(9*i-6) = F_schedule_hour(9*i-5);
                F_schedule_hour(9*i-7) = F_schedule_hour(9*i-6);
                F_schedule_hour(9*i-8) = F_schedule_hour(9*i-7);
            end
        end
    end
end
for i=1:temp
    if F_schedule_hour(9*i) == -100
        F_schedule_hour(9*i) = F_schedule_hour(9*i-1);
        if F_schedule_hour(9*i-1) == -100
            F_schedule_hour(9*i-1) = F_schedule_hour(9*i-2);
            F_schedule_hour(9*i) = F_schedule_hour(9*i-1);
            if F_schedule_hour(9*i-2) == -100
                F_schedule_hour(9*i-2) = F_schedule_hour(9*i-3);
                F_schedule_hour(9*i-1) = F_schedule_hour(9*i-2);
                F_schedule_hour(9*i) = F_schedule_hour(9*i-1);
            end
        end
    end
end

% G line
temp=fix(size(G_schedule_hour,2)/9);
for i=1:temp
    if G_schedule_hour(9*i-8) == -100
        G_schedule_hour(9*i-8) = G_schedule_hour(9*i-7);
        if G_schedule_hour(9*i-7) == -100
            G_schedule_hour(9*i-7) = G_schedule_hour(9*i-6);
            G_schedule_hour(9*i-8) = G_schedule_hour(9*i-7);
            if G_schedule_hour(9*i-6) == -100
                G_schedule_hour(9*i-6) = G_schedule_hour(9*i-5);
                G_schedule_hour(9*i-7) = G_schedule_hour(9*i-6);
                G_schedule_hour(9*i-8) = G_schedule_hour(9*i-7);
            end
        end
    end
end
for i=1:temp
    if G_schedule_hour(9*i) == -100
        G_schedule_hour(9*i) = G_schedule_hour(9*i-1);
        if G_schedule_hour(9*i-1) == -100
            G_schedule_hour(9*i-1) = G_schedule_hour(9*i-2);
            G_schedule_hour(9*i) = G_schedule_hour(9*i-1);
            if G_schedule_hour(9*i-2) == -100
                G_schedule_hour(9*i-2) = G_schedule_hour(9*i-3);
                G_schedule_hour(9*i-1) = G_schedule_hour(9*i-2);
                G_schedule_hour(9*i) = G_schedule_hour(9*i-1);
            end
        end
    end
end