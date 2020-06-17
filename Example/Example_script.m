%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:  | Example of usage of the library "BeamStressLib"                                            %
%---------------+--------------------------------------------------------------------------------------------%
% Author:       | Mora  Alberto                                                                              %
%---------------+--------------------------------------------------------------------------------------------%
% Date:         | 08/06/2020                                                                                 %
%---------------+--------------------------------------------------------------------------------------------%
% Note:         | 1) Use SI unit => Force  [N]                                                               %
%               |                => Moment [N*m]                                                             %
%               |                => Linear displacement [m]                                                  %
%               |                => Angular displacement [rad]                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; format shortEng; set(0,'DefaultFigureWindowStyle','docked'); close all;

% SIMULATION PARAMETERS
SimulinkFileName = 'Example_simscape';                                      % Name of the Simulink model
N_elements = 1;                                                             % Number of elements. It must be in the integer range [1, 64]. Max use 3, otherwise we get real positive poles.
t_simulation = 100;                                                         % Duration of the time-domain simulation of the Simulink model

% MATERIAL (steel)
E = 200000;                                                                 % Young modulus [MPa]
nu = 0.3;                                                                   % Poisson [-]
rho = 7800;                                                                 % Density [kg/m^3]
dampingConstant = 0.1;                                                      % C=dampingConstant*K. Unit of measurement [s]. The damping matrix of the beam is proportional to the stiffness matrix according to "dampingConstant" coefficient.

% GEOMETRY
b  = 0.003;                                                                 % Width [m]
t  = 0.001;                                                                 % Thickness [m]
L1 = 0.015;                                                                 % Vertical arm length [m] 


u_force=[
        1                                                                   % Fx
        2                                                                   % Fy
        3                                                                   % Fz
        0.01                                                                % Mx
        0.03                                                                % My
        0.01                                                                % Mz
        ];


out=sim(SimulinkFileName,t_simulation);                            % Run simulink time simulation


