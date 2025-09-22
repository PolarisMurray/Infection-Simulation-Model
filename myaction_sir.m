function [s_n, i_n, r_n] = myaction_sir(s, i, r, beta, gamma)
% compute new infections and recoveries
infected = beta * i * s;
recovered = gamma * i;
    
% Update state
s_n = s - infected;
i_n = i + infected - recovered;
r_n = r + recovered;
end