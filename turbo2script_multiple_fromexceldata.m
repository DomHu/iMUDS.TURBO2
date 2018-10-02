function turbo2script_multiple_fromexceldata(data, nocarriers, noexps, expname)
%% MATLAB script to run TURBO2 experiment with input data
%% ALSO plots the results - either just the isotope signal 
% or if abundance change is wanted set plot_abu_iso = true;
% or if just the mean result of all experiments is wanted set plot_just_mean = true;

% data = matrix of required data (age, mxl, abu, iso) - explanation see below
% nocarriers = number of carriers to be measured
% noexps = number of experiments for SA
% expname = experiment name

% age = age of sediment layer down core
% mxl = series of mixed layer thicknesses (zbio) down core
% abu = series of abundances of carrier type 1 down core
% iso = original isotope signature of both carrier  types 1 and 2

% clear
% data = load('turbo2input_homogenousmixing.txt');
% data = load('turbo2input_impulsesequence.txt');
% data = load('turbo2input_impulsesequence_5cm.txt');
% data = load('turbo2input_stepsequence.txt');
% data = load('turbo2input_termination.txt');

%data = load(datafile);

%%

plot_abu_iso = false;       % plot the abundance and isotope figures?
plot_just_mean = false;     % only plot the mean result, not every single experiment in grey

age   = data(:,1);
mxl   = data(:,2);
abu   = data(:,3);
iso   = data(:,4);
lngth = length(data(:,1));

numb  = nocarriers;     %50;     % number of carriers to be measured
exps = noexps;     % number of different experiments

%%
for i = 1:exps           
    [oriabu(i,:,:),bioabu(i,:,:),oriiso(i,:,:),bioiso(i,:,:)] = turbo2(abu,iso,mxl,numb);
end
%%
%[oriabu1,bioabu1,oriiso1,bioiso1] = turbo2(abu,iso,mxl,numb);
%[oriabu2,bioabu2,oriiso2,bioiso2] = turbo2(abu,iso,mxl,numb);
mean_bioabu1 = zeros(1,lngth);
mean_bioabu2 = zeros(1,lngth);
mean_bioiso1 = zeros(1,lngth);
mean_bioiso2 = zeros(1,lngth);

%%
mxltext = num2str(mean(mxl));
numbtxt = num2str(numb,2);
expstxt = num2str(exps,2);

set(0,'DefaultAxesFontSize',16)

%%  Plot isotope plots only  
mean_bioiso1 = zeros(1,lngth);
mean_bioiso2 = zeros(1,lngth);

figure, hold on
for i = 1:exps           
    plot(1:lngth,bioiso(i,:,1), 'Color', [0.5 0.5 0.5],'Linewidth',1.5)
    plot(1:lngth,bioiso(i,:,2), 'Color', [0.7 0.7 0.7],'Linewidth',1.5)
  	mean_bioiso1 = mean_bioiso1+bioiso(i,:,1);
    mean_bioiso2 = mean_bioiso2+bioiso(i,:,2);
end
plot(1:lngth,oriiso(1,:,1),'k','Linewidth',2.0) % plot one of the original iso
mean_bioiso1 = mean_bioiso1/exps;
mean_bioiso2 = mean_bioiso2/exps;
plot(1:lngth,mean_bioiso1, '-b','Linewidth',2.0)
plot(1:lngth,mean_bioiso2, '--r','Linewidth',2.0)
set(gca,'YDir','Reverse','XGrid','On','YGrid','On','Box','On', 'XLim',[0,200])
xlabel('Core depth (cm) ');
ylabel('\delta^{18}O');
titletxt = ['Isotopes of Carriers 1+2, ',mxltext,...
    ' cm Mixed Layer, ',numbtxt,' Carriers'];
title(titletxt)
%legend('Original Isotopes','carriers 1','carriers 2')


printfilename = [expname,'_zbio',mxltext,'_',numbtxt,'carriers_',expstxt,'Exps_fig2_iso'];
% print('-depsc', printfilename); % save figure in this folder
print('-depsc', ['output/',printfilename]);   % save figure in extra output folder
% print('-dtiff',printfilename)
% 

%% Plot abundance and isotope plots
if(plot_abu_iso)
figure
subplot(2,2,1), hold on
for i = 1:exps           
    plot(1:lngth,bioabu(i,:,1), 'Color', [0.5 0.5 0.5],'Linewidth',1.5)
    mean_bioabu1 = mean_bioabu1+bioabu(i,:,1);
end
plot(1:lngth,oriabu(1,:,1),'k','Linewidth',2.0) % plot one of the original abu
mean_bioabu1 = mean_bioabu1/exps;
plot(1:lngth,mean_bioabu1, '-b','Linewidth',2.0)
plot(1:lngth,numb*ones(lngth),'g')
set(gca,'XGrid','On','YGrid','On', 'YLim',[0,500],'YTick',[0 100 200 300 400 500])
% set(gca,'XGrid','On','YGrid','On', 'XLim',[0,200], 'YLim',[0,600],'YTick',[0 200 400 600])
% set(gca,'XGrid','On','YGrid','On','YTick',[0 200 400 600 800 1000])
xlabel('Core depth (cm) ');
ylabel('Number of Particles');
% legend('Original abundance','Bioturbated abundance Species 1')
title('Abundance of Species 1')

subplot(2,2,2), hold on
for i = 1:exps           
    plot(1:lngth,bioabu(i,:,2), 'Color', [0.7 0.7 0.7],'Linewidth',1.5)
    mean_bioabu2 = mean_bioabu2+bioabu(i,:,2);
end
plot(1:lngth,oriabu(1,:,2),'k','Linewidth',2.0) % plot one of the original abu
mean_bioabu2 = mean_bioabu2/exps;
plot(1:lngth,mean_bioabu2, '-r','Linewidth',2.0)
plot(1:lngth,numb*ones(lngth),'g')
set(gca,'XGrid','On','YGrid','On', 'YLim',[0,500],'YTick',[0 100 200 300 400 500])
% set(gca,'XGrid','On','YGrid','On', 'XLim',[0,200], 'YLim',[0,600],'YTick',[0 200 400 600])
% set(gca,'XGrid','On','YGrid','On','YTick',[0 200 400 600 800 1000])
xlabel('Core depth (cm) ');
ylabel('Number of Particles');
% legend('Original abundance','Bioturbated abundance Species 2')
title('Abundance of Species 2')

subplot(2,2,3), hold on
for i = 1:exps           
    plot(1:lngth,bioiso(i,:,1), 'Color', [0.5 0.5 0.5],'Linewidth',1.5)
    mean_bioiso1 = mean_bioiso1+bioiso(i,:,1);
end
plot(1:lngth,oriiso(1,:,1),'k','Linewidth',2.0) % plot one of the original iso
mean_bioiso1 = mean_bioiso1/exps;
plot(1:lngth,mean_bioiso1, '-b','Linewidth',2.0)
set(gca,'YDir','Reverse','XGrid','On','YGrid','On');%, 'XLim',[0,200])
xlabel('Core depth (cm) ');
ylabel('\delta^{18}O');
% legend('Original isotope record','Bioturbated isotope record Sp 1')
title('Isotopes of Species 1')

subplot(2,2,4), hold on
for i = 1:exps           
    plot(1:lngth,bioiso(i,:,2), 'Color', [0.7 0.7 0.7],'Linewidth',1.5)   
    mean_bioiso2 = mean_bioiso2+bioiso(i,:,2);
end
plot(1:lngth,oriiso(1,:,2),'k','Linewidth',2.0) % plot one of the original iso
mean_bioiso2 = mean_bioiso2/exps;
plot(1:lngth,mean_bioiso2, '-r','Linewidth',2.0)
set(gca,'YDir','Reverse','XGrid','On','YGrid','On');%, 'XLim',[0,200])
xlabel('Core depth (cm) ');
ylabel('\delta^{18}O');
% legend('Original isotope record','Bioturbated isotope record Sp 2')
title('Isotopes of Species 2')

%printfilename = ['turbo2_fig1_',mxltext,'cm_',numbtxt,'carriers.tiff'];
printfilename = [expname,'_zbio',mxltext,'_',numbtxt,'carriers_',expstxt,'Exps_fig1'];
% print('-dtiff',[printfilename,'.tiff']);
% print('-depsc', printfilename);
print('-depsc', ['output/', printfilename]);

end


%%  Plot only the mean result, not every single experiment in grey
if(plot_just_mean)
    figure
    subplot(2,2,1), hold on
    plot(1:lngth,oriabu(1,:,1),'k','Linewidth',2.0) % plot one of the original abu
    plot(1:lngth,mean_bioabu1, '-b','Linewidth',2.0)
    plot(1:lngth,numb*ones(lngth),'g')
    set(gca,'XGrid','On','YGrid','On', 'YLim',[0,500],'YTick',[0 100 200 300 400 500])
    % set(gca,'XGrid','On','YGrid','On','YTick',[0 200 400 600 800 1000])
    xlabel('Core depth (cm) ');
    ylabel('Number of Particles');
    % legend('Original abundance','Bioturbated abundance Species 1')
    title('Abundance of Species 1')

    subplot(2,2,2), hold on
    plot(1:lngth,oriabu(1,:,2),'k','Linewidth',2.0) % plot one of the original abu
    plot(1:lngth,mean_bioabu2, '-r','Linewidth',2.0)
    plot(1:lngth,numb*ones(lngth),'g')
    set(gca,'XGrid','On','YGrid','On', 'YLim',[0,500],'YTick',[0 100 200 300 400 500])
    % set(gca,'XGrid','On','YGrid','On','YTick',[0 200 400 600 800 1000])
    xlabel('Core depth (cm) ');
    ylabel('Number of Particles');
    % legend('Original abundance','Bioturbated abundance Species 2')
    title('Abundance of Species 2')

    subplot(2,2,3), hold on
    plot(1:lngth,oriiso(1,:,1),'k','Linewidth',2.0) % plot one of the original iso
    plot(1:lngth,mean_bioiso1, '-b','Linewidth',2.0)
    set(gca,'YDir','Reverse','XGrid','On','YGrid','On')
    xlabel('Core depth (cm) ');
    ylabel('\delta^{18}O');
    % legend('Original isotope record','Bioturbated isotope record Sp 1')
    title('Isotopes of Species 1')

    subplot(2,2,4), hold on
    plot(1:lngth,oriiso(1,:,2),'k','Linewidth',2.0) % plot one of the original iso
    plot(1:lngth,mean_bioiso2, '-r','Linewidth',2.0)
    set(gca,'YDir','Reverse','XGrid','On','YGrid','On')
    xlabel('Core depth (cm) ');
    ylabel('\delta^{18}O');
    % legend('Original isotope record','Bioturbated isotope record Sp 2')
    title('Isotopes of Species 2')

    %printfilename = ['turbo2_fig1_',mxltext,'cm_',numbtxt,'carriers.tiff'];
    printfilename = [datafile(1:end-4),'_',numbtxt,'carriers_',expstxt,'Exps_fig1_abu+iso_1Exp'];
%    print('-dtiff',[printfilename,'.tiff']);
    print('-depsc', printfilename);
    % print('-depsc', ['output/', printfilename]);
end

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


