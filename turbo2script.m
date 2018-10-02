%% MATLAB script to run TURBO2
clear
% data = load('turbo2input_homogenousmixing.txt');
% data = load('turbo2input_impulsesequence.txt');
% data = load('turbo2input_stepsequence.txt');
data = load('turbo2input_termination.txt');

%%
age   = data(:,1);
mxl   = data(:,2);
abu   = data(:,3);
iso   = data(:,4);
lngth = length(data(:,1));

numb  = 50;     % number of carriers to be measured

%%
[oriabu,bioabu,oriiso,bioiso] = turbo2(abu,iso,mxl,numb);

%%
%[oriabu1,bioabu1,oriiso1,bioiso1] = turbo2(abu,iso,mxl,numb);
%[oriabu2,bioabu2,oriiso2,bioiso2] = turbo2(abu,iso,mxl,numb);

if(true)
%%
mxltext = num2str(mean(mxl));
numbtxt = num2str(numb,2);

%%
subplot(2,2,1)
plot(1:lngth,oriabu(:,1),'k'), hold on
plot(1:lngth,bioabu(:,1),'b')
plot(1:lngth,numb*ones(lngth),'g')
set(gca,'XGrid','On','YGrid','On')
xlabel('Core depth (cm) ');
ylabel('Number of Particles');
legend('Original abundance','Bioturbated abundance Sp 1')
title('Abundance of Carrier 1')
subplot(2,2,2)
plot(1:lngth,oriabu(:,2),'k'), hold on
plot(1:lngth,bioabu(:,2),'r')
plot(1:lngth,numb*ones(lngth),'g')
set(gca,'XGrid','On','YGrid','On')
xlabel('Core depth (cm) ');
ylabel('Number of Particles');
legend('Original abundance','Bioturbated abundance Sp 2')
title('Abundance of Carrier 2')
subplot(2,2,3)
plot(1:lngth,oriiso(:,1),'k'), hold on
plot(1:lngth,bioiso(:,1),'b')
set(gca,'YDir','Reverse','XGrid','On','YGrid','On')
xlabel('Core depth (cm) ');
ylabel('\delta^{18}O');
legend('Original isotope record','Bioturbated isotope record Sp 1')
title('Isotopes of Carrier 1')
subplot(2,2,4)
plot(1:lngth,oriiso(:,2),'k'), hold on
plot(1:lngth,bioiso(:,2),'r')
set(gca,'YDir','Reverse','XGrid','On','YGrid','On')
xlabel('Core depth (cm) ');
ylabel('\delta^{18}O');
legend('Original isotope record','Bioturbated isotope record Sp 2')
title('Isotopes of Carrier 2')

%%
%printfilename = ['turbo2_fig1_',mxltext,'cm_',numbtxt,'carriers.tiff'];
printfilename = ['turbo2_fig1_',mxltext,'cm_',numbtxt,'carriers'];
print('-dtiff',[printfilename,'.tiff']);
print('-depsc', printfilename);

%%
figure, hold on
plot(1:lngth,oriiso(:,1),'k')
plot(1:lngth,bioiso(:,1),'b')
plot(1:lngth,bioiso(:,2),'r')
set(gca,'YDir','Reverse','XGrid','On','YGrid','On','Box','On')
titletxt = ['Isotopes of Carriers 1+2, ',mxltext,...
    ' cm Mixed Layer, ',numbtxt,' Carriers'];
title(titletxt)
legend('Original Isotopes','carriers 1','carriers 2')

%%
printfilename = ['turbo2_fig2_',mxltext,'cm_',numbtxt,'carriers.tiff'];
print('-dtiff',printfilename)
% 
%%
% figure, hold on
% plot(1:lngth,oriiso1(:,2),'k')
% plot(1:lngth,bioiso1(:,2),'b')
% plot(1:lngth,bioiso2(:,2),'r')
% set(gca,'YDir','Reverse','XGrid','On','YGrid','On','Box','On')
% titletxt = ['Isotopes of Carriers 1+2, ',mxltext,...
%     ' cm Mixed Layer, ',numbtxt,' Carriers'];
% title(titletxt)
% legend('Original Isotopes','carriers 1','carriers 2')
% 
% %%
% printfilename = ['turbo2_fig2_',mxltext,'cm_',numbtxt,'carriers.tiff'];
% print('-dtiff',printfilename)

end

