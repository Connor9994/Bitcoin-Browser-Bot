clear,clc,close all
[fname,pathname]=uigetfile('*.csv','Select First File');
[num,txt,raw] = xlsread(fname);
Titles=raw(1,1:end);

Titles={'Direction','Outer_Ratio','Inner_Ratio','Change_In_Dollars','Change_Over_Last_4_minutes','Total_Profit'};
Direction=raw(2:end,1);
Outer_Ratio=raw(2:end,2); Outer_Ratio=cell2mat(Outer_Ratio);
Inner_Ratio=raw(2:end,3); Inner_Ratio=cell2mat(Inner_Ratio);
Change_In_Dollars=raw(2:end,4); Change_In_Dollars=cell2mat(Change_In_Dollars); Change_In_Dollars=cumsum(Change_In_Dollars);
Change_Over_Last_4_Minutes=raw(2:end,5); Change_Over_Last_4_Minutes=cell2mat(Change_Over_Last_4_Minutes);
Change_Over_Last_8_Minutes=raw(2:end,6); Change_Over_Last_8_Minutes=cell2mat(Change_Over_Last_8_Minutes);
Rate_Derivative=raw(2:end,7); Rate_Derivative=cell2mat(Rate_Derivative);
Total_Profit=raw(2:end,8); Total_Profit=cell2mat(Total_Profit);

figure
set(gcf, 'Position', [1 1 1800 1080]);
subplot(4,1,1)
plot(Change_In_Dollars);title('BTC Price');xlabel('Samples');ylabel('Price ($)')
subplot(4,1,2)
plot(Change_Over_Last_4_Minutes);title('Change Over 4-Min');xlabel('Samples');ylabel('Ratio')
hold on
plot(Change_Over_Last_4_Minutes*0+.01);
hold off
subplot(4,1,3)
plot(Rate_Derivative);title('Rate Derivative');xlabel('Samples');ylabel('Ratio')
hold on
plot(Rate_Derivative*0+.002)
hold off
subplot(4,1,4)
plot(Total_Profit);title('Total Profit');xlabel('Samples');ylabel('Profit')


figure
subplot(2,1,1)
plot(Change_In_Dollars);title('BTC Price');xlabel('Samples');ylabel('Price ($)')
subplot(2,1,2)
plot(Inner_Ratio);title('Inner Ratio');xlabel('Samples');ylabel('Ratio')

figure
set(gcf, 'Position', [1 1 1800 1080]);
subplot(2,1,1)
plot(Change_In_Dollars);title('BTC Price');xlabel('Samples');ylabel('Price ($)')
subplot(2,1,2)
plot(Outer_Ratio);title('Outer Ratio');xlabel('Samples');ylabel('Ratio')



