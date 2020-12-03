
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
[A,labels,abundance_Matrix] = xlsread(file,sheet,rangeAbund);
% refference potentials  kJ/mole
[muReff] = xlsread(file,sheet,range_mu);
% intial estimate of moles 
%  [intMole,txt2,mole]= xlsread(file,sheet,range_mole);
[intMole]= xlsread(file,sheet,range_mole);
%  [intMole] = xls read(file,sheet,range_mole);

 moles = intMole;
%Enter thermodynamics data
R = 8.314/1000; % kJ/mole K
P = input('Enter Pressure in atm :'); %atm
T= input('Enter Temperature in Kelvin: '); %Kelvin
iter = input('Enter number of Iterations: ');
% tol  = input('Enter the tolerance: ');

% Calualte stiohcometeric vectors from null space of formula matrix 
%abundance_Matrix
FV =null(A,'r');
% test conservation
% numb*FV1' 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Thermodymanics equilibrium  chemical potiental
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Newton Raphson minimization method
  nt =sum(moles);
  s=0;
  w=0;
 for s = 1 : size(moles,1) 
            % set number columns 
            for w = 1 : length(moles)
           mu(s,w) = muReff(s,w)+ (R*T*log(moles(s,w)/nt));
            end
 end
    gibbsInt= (mu .* FV); 
%  extRx =zeros(length(moles));
 i = 1; 
%  molesCalc =0;
 s=0;
 w=0;
%      while i <= iter
%        
%       % calculate mu 
%       
%        for s = 1 : size(moles,1) 
%             % set number columns 
%             for w = 1 : length(moles)
%            mu(s,w) = muReff(s,w)+ (R*T*log(moles(s,w)/nt));
%             end
%  end 
%      gibbs = (mu .* FV);
% %      gibbs=sum(gibbs,2)
%      dgibbs = gibbs - gibbsInt;
%      CB=[A',moleInt];
% N = rref(CB)
% B = rref(A);
% n = rank(CB);
%      Dgibbs = gibbsInt - gibbs;
%        if Dgibbs < tol
%            break
%        end
     
     
     %deltaGibbs = sum(gibbs,2);      
    % claculate pseudo jacobian based on moles jac()
%     % need  square matrix for inverse to exist ie non-signular
%      for k = 1:rank(FV)
%           for j = 1 : length(moles) 
% %       % kd = kroneker delta       
%               if k==j
%                   kd =1;
%               else
%                   kd=0;
%               end
% %                 kd =1;
%                jac(k,j) = R*T*(kd/moles(j)-1/nt);
%           end
%      end
     % psuedo iverse jacobian
     %
     
    
% % H = jac'*inv(jac*jac')     
% %      deltaE = -H\dgibbs
% %      gibbsInt = gibbs;      
     

%          molesCalc = FV.*extRx; 
%          moleTot = moles -molesCalc;  

     
      
      

% %       nv = sum(molesCalc);
% %       nt = sum(nv,2);
%       nt = nt +1;
      i = i+1;
%      end

 
 
%   fprintf('\nApibb = Zprox mu = %11.8f \n\n',mu);     
%fprintf('\nApprox Gibbs = %11.8f ',gibbsE);     
  






