% test123 test123

function [s_n, i_n, r_n, d_n] = action_sir(s, i, r, d, beta, gamma, mu)
% Advance an SIR model one timestep
%
% Usage
%   [s_n, i_n, r_n, d_n] = action_sir(s, i, r, d, beta, gamma, mu)
% 
% Arguments
%   s = current number of susceptible individuals
%   i = current number of infected individuals
%   r = current number of recovered individuals
%   d = current number of dead individuals
%   
%   beta = infection rate parameter
%   gamma = recovery rate paramter
%   mu = death rate parameter
% 
% Returns
%   s_n = next number of susceptible individuals
%   i_n = next number of infected individuals
%   r_n = next number of recovered individuals
%   d_n = next number of dead individuals

% compute new infections and recoveries
infected = beta * i * s;
recovered = gamma * i;
dead = mu * i;

infected = min(infected, s);
recovered = min(recovered, i);
dead = min(dead, i - recovered);

% Update state
s_n = s - infected;
i_n = i + infected - recovered;
r_n = r + recovered;
d_n = d + dead;


% Enforce invariants; necessary since we're doing a discrete approx.
s_n = max(s_n, 0);
i_n = max(i_n, 0);
r_n = max(r_n, 0);
d_n = max(d_n, 0);
    

end


