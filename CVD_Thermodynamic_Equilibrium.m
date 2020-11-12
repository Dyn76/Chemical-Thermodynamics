
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
[muReff] = xlsread(file,sheet,range_mu);
% intial estimate of moles 
% [intMole,txt2,mole]= xlsread(file,sheet,range_mole);
[intMole] = xlsread(file,sheet,range_mole);
% rangeb = 'K2:K5';
% rangeSC =  'B2:H5';
% AbundanceSC= xlsread(file,sheet,rangeSC);
% [b] = xlsread(file,sheet,rangeb);
% no = AbundanceSC\b

%Enter thermodynamics data
R = 8.314/1000; % kJ/mole K
P = input('Enter Pressure in atm :'); %atm
T= input('Enter Temperature in Kelvin: '); %Kelvin
iter = input('Enter number of Iterations: ');
tol  = input('Enter the tolerance: ');

% Calualte stiohcometeric vectors from null space of formula matrix 
%abundance_Matrix
FV =null(numb,'r')';
% test conservation
% numb*FV1' 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Thermodymanics equilibrium  chemical potiental
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Newton Raphson minimization method
 
 moles = intMole();
 nt =sum(moles);

       for s = 1 : length(moles) 
        mu(s) = muReff(s)+ (R*T*log(moles(s)/nt));
       end
       gibbs = mu ./FV;
 i = 1;      
     while i <= iter
        gibbs = gibbs;
   
    % claculate jacobian based on moles jac()
     for k = 1:rank(FV)
          for j = 1 : length(moles) 
      % kd = kroneker delta       
%               if k==j
%                   kd =1;
%               else
%                   kd=0;
%               end
               kd =1;
               jac(k,j) = R*T*(kd/moles(j)-1/nt);
          end
     end
     jacI = 1./(jac' * jac) * jac'; 
     % claculate extent reaction

     % clac new amount moles 
     for e =1 : rank(FV)
       for m =  1:length(moles)
         moles(m) = moles(m) - w*jacI * extentRx(e);      
       end
     end 
     nt = summ(moles);
      % create potitial E matrix
      
     for s = 1 : length(moles) 
      mu(s) = muReff(s)+ (R*T*log(moles(s)/nt));
     end
     gibbs2 = mu .* FV;
     deltaGibbs = gibbs1-gibbs;
       if deltaGibbs < tol
           break
       end
         
      i = i+1;
     end

 
 
%   fprintf('\nApibb = Zprox mu = %11.8f \n\n',mu);     
%fprintf('\nApprox Gibbs = %11.8f ',gibbsE);     
  






