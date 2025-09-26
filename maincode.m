% How could we model Covid19 in Singapre
% variables, immune, not immune.
% dynamic intervention variables 


beta_base = 0.45;              % initial infectioon rate
intervention_factor = 0.5; % intervention rate
intervention_day = 30;  
beta = beta_base * (1 - intervention_factor);

gamma = 0.245; % Recovery rate (1 / day)
mu = 0.0009;                   % death rate

i_1 = 1;                       
n_total = 5700000;             % population
week_end = 14;                 % 14weeks 


% Define initial state
s_1 = n_total - i_1;
r_1 = 0;
d_1 = 0;


[S_fix, I_fix, R_fix, D_fix, W_fix] = simulate_sir(s_1, i_1, r_1, d_1, beta_base, gamma, mu, week_end * 7, intervention_day, intervention_factor);
T_fix = S_fix + I_fix + R_fix + D_fix;

% NOTE: Do not edit this code; Plot multiple diagnostic quantities
figure()
plot(W_fix, T_fix, 'k-', 'DisplayName', 'Total'); hold on
plot(W_fix, S_fix, 'DisplayName', 'S')
plot(W_fix, I_fix, 'DisplayName', 'I')
plot(W_fix, R_fix, 'DisplayName', 'R')
plot(W_fix, D_fix, 'DisplayName', 'D')
%S_fix
%I_fix
%R_fix
%T_fix 

xlabel("Day")
ylabel("Persons")
legend()
title("ingapore COVID-19 Simulation (Jan–Apr 2020) with Mask Intervention")