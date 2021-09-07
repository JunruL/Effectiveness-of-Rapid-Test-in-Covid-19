function dYdt = model(t, Y, para)
    % SEIQR Model with rapid test
    Lambda = para(1); % birth rate
    mu = para(2); % natural death rate
    alpha = para(3); % virus-induced average fatality rate
    beta = para(4); % prob of disease transmission per contact *
              % the number of contacts per unit time.
    epsilon = para(5); % rate of progression from exposed to infectious
    gamma = para(6); % recovery rate of infectious individuals
    lambda = para(7); % percentage of the population taking rapid tests per unit time
    eta = para(8); % effectiveness of the test (0~1)
    
    test = lambda * eta;
    
    S = Y(1); % Susceptible
    E = Y(2); % Exposed
    I = Y(3); % Infected
    Q = Y(4); % Quarantined
    R = Y(5); % Recovered
    
    % differential equations
    dSdt = Lambda - (mu + beta*I/(S+E+I+R)) * S;
    dEdt = beta*I/(S+E+I+R)*S - (mu+epsilon+test)*E;
    dIdt = epsilon*E - (mu+gamma+alpha+test)*I;
    dQdt = test*(E+I) - (mu+gamma+alpha)*Q;
    dRdt = gamma*(Q+I) - mu*R;
    
    % return value
    dYdt = [dSdt; dEdt; dIdt; dQdt; dRdt];
end
