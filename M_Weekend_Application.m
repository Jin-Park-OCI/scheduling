%% �ָ�(��,��) �ݿ� + % ���� ����(��,ȭ,��,��,��) �ݿ� (hour)
if DOW==0 % 1���� �Ͽ����� ���
    DOW=DOW+1;
    for i=1:floor((size(E_schedule_hour,2)+(DOW-1)*hour)/(5*hour))
        E_schedule_hour = [E_schedule_hour(1:(7*i-DOW-1)*hour) -ones(1,hour*2) E_schedule_hour((7*i-DOW-1)*hour+1:size(E_schedule_hour,2))];
    end
    for i=1:floor((size(F_schedule_hour,2)+(DOW-1)*hour)/(5*hour))
        F_schedule_hour = [F_schedule_hour(1:(7*i-DOW-1)*hour) -ones(1,hour*2) F_schedule_hour((7*i-DOW-1)*hour+1:size(F_schedule_hour,2))];
    end
    for i=1:floor((size(G_schedule_hour,2)+(DOW-1)*hour)/(5*hour))
        G_schedule_hour = [G_schedule_hour(1:(7*i-DOW-1)*hour) -ones(1,hour*2) G_schedule_hour((7*i-DOW-1)*hour+1:size(G_schedule_hour,2))];
    end
    E_schedule_hour = [-ones(1,hour) E_schedule_hour];
    F_schedule_hour = [-ones(1,hour) F_schedule_hour];
    G_schedule_hour = [-ones(1,hour) G_schedule_hour];
    DOW=DOW-1;
elseif DOW==6 % 1���� ������� ���
    DOW=DOW-5;
    for i=1:floor((size(E_schedule_hour,2)+(DOW-1)*hour)/(5*hour))
        E_schedule_hour = [E_schedule_hour(1:(7*i-DOW-1)*hour) -ones(1,hour*2) E_schedule_hour((7*i-DOW-1)*hour+1:size(E_schedule_hour,2))];
    end
    for i=1:floor((size(F_schedule_hour,2)+(DOW-1)*hour)/(5*hour))
        F_schedule_hour = [F_schedule_hour(1:(7*i-DOW-1)*hour) -ones(1,hour*2) F_schedule_hour((7*i-DOW-1)*hour+1:size(F_schedule_hour,2))];
    end
    for i=1:floor((size(G_schedule_hour,2)+(DOW-1)*hour)/(5*hour))
        G_schedule_hour = [G_schedule_hour(1:(7*i-DOW-1)*hour) -ones(1,hour*2) G_schedule_hour((7*i-DOW-1)*hour+1:size(G_schedule_hour,2))];
    end
    E_schedule_hour = [-ones(1,hour*2) E_schedule_hour];
    F_schedule_hour = [-ones(1,hour*2) F_schedule_hour];
    G_schedule_hour = [-ones(1,hour*2) G_schedule_hour];
    DOW=DOW+5;
else % 1���� ������ ��� (��,ȭ,��,��,��)
    for i=1:floor((size(E_schedule_hour,2)+(DOW-1)*hour)/(5*hour))
        E_schedule_hour = [E_schedule_hour(1:(7*i-DOW-1)*hour) -ones(1,hour*2) E_schedule_hour((7*i-DOW-1)*hour+1:size(E_schedule_hour,2))];
    end
    for i=1:floor((size(F_schedule_hour,2)+(DOW-1)*hour)/(5*hour))
        F_schedule_hour = [F_schedule_hour(1:(7*i-DOW-1)*hour) -ones(1,hour*2) F_schedule_hour((7*i-DOW-1)*hour+1:size(F_schedule_hour,2))];
    end
    for i=1:floor((size(G_schedule_hour,2)+(DOW-1)*hour)/(5*hour))
        G_schedule_hour = [G_schedule_hour(1:(7*i-DOW-1)*hour) -ones(1,hour*2) G_schedule_hour((7*i-DOW-1)*hour+1:size(G_schedule_hour,2))];
    end
end