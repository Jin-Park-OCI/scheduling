%% MATLAB to Excel result export

% 1번째 spreadsheet

temp=[];
t = Y*10000+M*100+1; %
t = datetime(t,'ConvertFrom','yyyymmdd');
t = datetime(t,'Format','MM/dd');
for i=1:sum(ed_month(M:M+1)) %%%%%%%%%% 12월의 경우에는 어떻게 할지?
    temp=[temp t];
    t=t+1;
end
temp=exceltime(temp); % M/1 ~ M+1/end

% Today_No=find(temp==exceltime(datetime('today','Format','MM/dd'))); % Today No.

% 1번째 spreadsheet
Sheet1=[temp; % Day
    temp; % Weekday
    zeros(size(Schedule_Day_row,1),D-1), Schedule_Day_row, zeros(size(Schedule_Day_row,1),size(temp,2)-size(Schedule_Day_row,2)-D+1); % Scheduling Result
    zeros(2,D-1), Result_Day, zeros(2,size(temp,2)-size(Schedule_Day_row,2)-D+1)]; % 일일생산량 & Scrap 총량

xlswrite('Excel-MATLAB.xlsx',Sheet1,'VIP','P2') % Day
% xlswrite('Excel-MATLAB.xlsx',temp,'VIP','K3') % Weekday
% xlswrite('Excel-MATLAB.xlsx',Schedule_Day_row,'VIP','K4') % 스케줄링 결과
xlswrite('Excel-MATLAB.xlsx',sum(Result_Day(2,:)),'VIP','M1') % 총 scrap 발생량

xlswrite('Excel-MATLAB.xlsx',VIP(:,9)-1,'VIP','N4') % 오늘로부터 생산마감까지 걸리는 일 수

% 2번째 spreadsheet
Sheet2=[temp; % Day
    temp; % Weekday
    zeros(size(Schedule_Day_row,1),D-1), Schedule_Day, zeros(size(Schedule_Day,1),size(temp,2)-size(Schedule_Day,2)-D+1); % Scheduling Result
    zeros(2,D-1), Result_Day, zeros(2,size(temp,2)-size(Schedule_Day,2)-D+1)]; % 일일생산량 & Scrap 총량

% xlswrite('Excel-MATLAB.xlsx',Sheet2,'VIP_sort','L2') % Day
% xlswrite('Excel-MATLAB.xlsx',temp,'VIP_sort','K2') % Day
% xlswrite('Excel-MATLAB.xlsx',temp,'VIP_sort','K3') % Weekday

% xlswrite('Excel-MATLAB.xlsx',temp2','VIP_sort','B3')
% xlswrite('Excel-MATLAB.xlsx',Schedule_Day,'VIP_sort','J3')

% 3번째 spreadsheet
% xlswrite('Excel-MATLAB.xlsx',Schedule_hour,'Colormap','E24')