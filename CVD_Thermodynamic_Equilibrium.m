
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CVD Thermodynamic Equilibrium
% Dan Kotabish 
% Based on chemical potentilas 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear 

% Enter Data from excel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
file = 'ZrCMatrix.xlsx';
sheet = 'Ex4_3';
rangeAbund ='A1:H5';
range_mu ='B9:H9';
range_mole ='B11:H11';
%abundance Matrix
[numb,labels,abundance_Matrix] = xlsread(file,sheet,rangeAbund);
% refference potentials  kJ/mole
[muReff,txt1,pot] = xlsread(file,sheet,range_mu);
% intial estimate of moles 
[intMole,txt2,mole]= xlsread(file,sheet,range_mole);
%Enter thermodynamics data
R = 8.314/1000; % kJ/mole K
P = 40; %atm
T= 220; %Kelvin


% Calualte stiohcometeric vectors from null space of formula matrix 
abundance_Matrix
ZE1 =null(numb,'r')'
% test conservation
 numb*ZE1' 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Thermodymanics equilibrium  chemical potiental
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%









