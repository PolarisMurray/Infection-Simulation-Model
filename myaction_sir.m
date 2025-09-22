function [s_n, i_n, r_n, d_n] = myaction_sir(s, i, r, beta, gamma, mu)
% compute new infections and recoveries
infected = beta * i * s;
recovered = gamma * i;
dead = mu * i;
    
% Update state
s_n = s - infected;
i_n = i + infected - recovered;
r_n = r + recovered;
d_n = d + dead;
end
