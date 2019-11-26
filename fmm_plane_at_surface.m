function fmm_plane_at_surface(n1, n2)

%*********************
%% NOTES
% Enter values of the refractive index.
% n = refractive index (either diectric or a medium
%******************** 


%*********************
%% INITIALIZE 
%******************** 
close all 
clc

%*********************
%% DASHBOARD
%********************
%n1 = 1; %air 
%n2 = 1.4; %glass  
theta = linspace(0, pi/2); 
theta2 = abs(asin((n1/n2).*sin(theta)));

%*********************
%% TE polarized ligth
%********************
tran_TE = (2.*n1*cos(theta))./(n1.*cos(theta) +n2.*cos(theta2)); 
ref_TE = (n1.*cos(theta)-n2.*cos(theta2))./(n1.*cos(theta) +n2.*cos(theta2));

%********************
%% Reflectance & Transmittanc 
%********************
R = abs(ref_TE).^2; 
R = R*100;
T = (n2.*cos(theta2)./(n1.*cos(theta)).*abs(tran_TE).^2); 
T = T*100; 
%********************
%% TM polarized light
%********************
tran_TM = (2.*n1*cos(theta))./(n1.*cos(theta2) +n2.*cos(theta)); 
ref_TM = (n1.*cos(theta2)-n2.*cos(theta))./(n1.*cos(theta2) +n2.*cos(theta));

%********************
%% Reflectance & Transmittanc 
%********************
R_TM = abs(ref_TM).^2; 
R_TM = R_TM*100;
T_TM = (n2.*cos(theta2)./(n1.*cos(theta)).*abs(tran_TM).^2); 
T_TM = T_TM*100; 
%********************
%% Plotting section 
%********************
figure1 = figure; 
plot(theta, (T), 'Linewidth', 2) 
hold on 
plot(theta, (R), 'Linewidth', 2)
plot(theta, (R_TM), 'Linewidth', 2)
plot(theta, (T_TM), 'Linewidth', 2)
xlabel('$\theta$', 'interpreter', 'latex');
ylabel('$T \& R$', 'interpreter', 'latex');
title('Reflectance and Transmittance Curve')
%% Create textbox
annotation(figure1,'textbox',...
    [0.857142857142857 0.497619047619048 0.0375 0.0547619047619047],...
    'String',{'TM'},...
    'FitBoxToText','off');
annotation(figure1,'textbox',...
    [0.742857142857142 0.48709523809524 0.03625 0.0547619047619048],...
    'String',{'TE'});