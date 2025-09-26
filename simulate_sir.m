function [S, I, R, D, W] = simulate_sir(s_0, i_0, r_0, d_0, beta_base, gamma, mu, num_steps, intervention_day, intervention_factor)
% Simulate a SIR model
%
% Usage
%   [S, I, R, D, W] = fcn_simulate(s_0, i_0, r_0, d_0, beta, gamma, mu, num_steps)
%
% Arguments
%   s_0 = initial number of susceptible individuals
%   i_0 = initial number of infected individuals
%   r_0 = initial number of recovered individuals
%   d_0 = initial number of dead individuals
%
%   beta = infection rate parameter
%   gamma = recovery rate parameter
%   mu = dead rate parameter
%
%   num_steps = number of simulation steps to simulate
%
% Returns
%   S = simulation history of susceptible individuals; vector
%   I = simulation history of infected individuals; vector
%   R = simulation history of recovered individuals; vector
%   D = simulation history of dead individuals; vector
%   W = simulation week; vector
%   

% Setup
S = zeros(1, num_steps); S(1) = s_0;
I = zeros(1, num_steps); I(1) = i_0;
R = zeros(1, num_steps); R(1) = r_0;
D = zeros(1, num_steps); D(1) = d_0;
W = 1 : num_steps;

% Run simulation
for step = 1 : (num_steps - 1)
    if step < intervention_day
            beta = beta_base;
        else
            beta = beta_base * (1 - intervention_factor);
    end

    [S(step+1), I(step+1), R(step+1), D(step+1)] = action_sir(S(step), I(step), R(step), D(step), beta, gamma, mu);
end

end
