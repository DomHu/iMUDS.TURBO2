function run_multiple_turbo2_exps_fromexceldata(datafile)
%% MATLAB script to run multiple experiments of TURBO2 using data in an excel file
% specify below where the data one wants to use can be found in excel file

% datafile = INPUT FILE WITH REQUIRED DATA

%   Example
%           run_multiple_turbo2_exps_fromexceldata('data/1_turbo2input_no_abu_change.xlsx')


data=xlsread(datafile,'zbio=5','C4:F63');
data_zbio10=data;
data_zbio10(:,2)=10;
turbo2script_multiple_fromexceldata(data, 20, 50, 'pointevent1')
turbo2script_multiple_fromexceldata(data_zbio10, 20, 50, 'pointevent1')
turbo2script_multiple_fromexceldata(data_zbio10, 5, 50, 'pointevent1')
% 
% data=xlsread(datafile,'zbio=5','H4:K63');
% data_zbio10=data;
% data_zbio10(:,2)=10;
% % turbo2script_multiple_fromexceldata(data, 20, 50, 'pointevent2')
% turbo2script_multiple_fromexceldata(data_zbio10, 20, 50, 'pointevent2')
% turbo2script_multiple_fromexceldata(data_zbio10, 5, 50, 'pointevent2')
% 
% data=xlsread(datafile,'zbio=5','M4:P63');
% data_zbio10=data;
% data_zbio10(:,2)=10;
% % turbo2script_multiple_fromexceldata(data, 20, 50, 'pointevent5')
% turbo2script_multiple_fromexceldata(data_zbio10, 20, 50, 'pointevent5')
% turbo2script_multiple_fromexceldata(data_zbio10, 5, 50, 'pointevent5')
% 
% data=xlsread(datafile,'zbio=5','R4:U203');
% data_zbio10=data;
% data_zbio10(:,2)=10;
% % turbo2script_multiple_fromexceldata(data, 20, 50, 'step-sequence')
% turbo2script_multiple_fromexceldata(data_zbio10, 20, 50, 'step-sequence')
% turbo2script_multiple_fromexceldata(data_zbio10, 5, 50, 'step-sequence')
% 
% 
% data=xlsread(datafile,'zbio=5','W4:Z143');
% data_zbio10=data;
% data_zbio10(:,2)=10;
% turbo2script_multiple_fromexceldata(data, 20, 50, 'gradual-changes')
% turbo2script_multiple_fromexceldata(data_zbio10, 20, 50, 'gradual-changes')
% turbo2script_multiple_fromexceldata(data_zbio10, 5, 50, 'gradual-changes')
% 
% data=xlsread(datafile,'zbio=5','AB4:AE204');
% data_zbio10=data;
% data_zbio10(:,2)=10;
% turbo2script_multiple_fromexceldata(data, 20, 50, '20kyrs')
% turbo2script_multiple_fromexceldata(data_zbio10, 20, 50, '20kyrs')
% turbo2script_multiple_fromexceldata(data_zbio10, 5, 50, '20kyrs')
% 
% data=xlsread(datafile,'zbio=5','AG4:AJ204');
% data_zbio10=data;
% data_zbio10(:,2)=10;
% turbo2script_multiple_fromexceldata(data, 20, 50, '40kyrs')
% turbo2script_multiple_fromexceldata(data_zbio10, 20, 50, '40kyrs')
% turbo2script_multiple_fromexceldata(data_zbio10, 5, 50, '40kyrs')
% 
% data=xlsread(datafile,'zbio=5','AL4:AO204');
% data_zbio10=data;
% data_zbio10(:,2)=10;
% turbo2script_multiple_fromexceldata(data, 20, 50, '100kyrs')
% turbo2script_multiple_fromexceldata(data_zbio10, 20, 50, '100kyrs')
% turbo2script_multiple_fromexceldata(data_zbio10, 5, 50, '100kyrs')

% data=xlsread(datafile,'zbio=5','AQ4:AT204');
% data_zbio10=data;
% data_zbio10(:,2)=10;
% data_zbio20=data;
% data_zbio20(:,2)=20;
% turbo2script_multiple_fromexceldata(data, 20, 50, '3_orbital_cycles')
% turbo2script_multiple_fromexceldata(data_zbio10, 20, 50, '3_orbital_cycles')
% turbo2script_multiple_fromexceldata(data_zbio10, 5, 50, '3_orbital_cycles')
% turbo2script_multiple_fromexceldata(data_zbio20, 20, 50, '3_orbital_cycles')
% turbo2script_multiple_fromexceldata(data_zbio20, 5, 50, '3_orbital_cycles')
% 
% data=xlsread(datafile,'zbio=5','AV4:AY204');
% data_zbio10=data;
% data_zbio10(:,2)=10;
% data_zbio20=data;
% data_zbio20(:,2)=20;
% turbo2script_multiple_fromexceldata(data, 20, 50, '3_orbital_cycles+pointevent')
% turbo2script_multiple_fromexceldata(data_zbio10, 20, 50, '3_orbital_cycles+pointevent')
% turbo2script_multiple_fromexceldata(data_zbio10, 5, 50, '3_orbital_cycles+pointevent')
% turbo2script_multiple_fromexceldata(data_zbio20, 20, 50, '3_orbital_cycles+pointevent')
% turbo2script_multiple_fromexceldata(data_zbio20, 5, 50, '3_orbital_cycles+pointevent')

% data=xlsread(datafile,'zbio=5','BA4:BD204');
% data_zbio10=data;
% data_zbio10(:,2)=10;
% data_zbio20=data;
% data_zbio20(:,2)=20;
% turbo2script_multiple_fromexceldata(data, 20, 50, '3_orbital_cycles+gradualchanges')
% turbo2script_multiple_fromexceldata(data_zbio10, 20, 50, '3_orbital_cycles+gradualchanges')
% turbo2script_multiple_fromexceldata(data_zbio10, 5, 50, '3_orbital_cycles+gradualchanges')
% turbo2script_multiple_fromexceldata(data_zbio20, 20, 50, '3_orbital_cycles+gradualchanges')
% turbo2script_multiple_fromexceldata(data_zbio20, 5, 50, '3_orbital_cycles+gradualchanges')
% 
