figure();

% plot 2D figures (with different values of alpha)
two_dim_plot(0, 'SEIR Model without Rapid Test', 3, 3, 1);
two_dim_plot(0.05, 'SEIR Model with Rapid Test (eff=0.05)', 3, 3, 2);
two_dim_plot(0.1, 'SEIR Model with Rapid Test (eff=0.1)', 3, 3, 3);
two_dim_plot(0.2, 'SEIR Model with Rapid Test (eff=0.2)', 3, 3, 4);

% preprocessing of 3D figures
% all of the folowing variables are vectors
T = [];
Eff = [];
S = [];
E = [];
I = [];
Q = [];
R = [];

for i = 0:2000 % alphas = linspace(0:0.0005:1)
    eff = i * 0.0005; % the value is between 0~1
    para = [1000 750 0.02 0.05 0.2 0.05 1 eff];
    model_ode = @(t, Y) model(t, Y, para); % function used in ode45
    period = [0 200]; % time period
    Y0 = [37740000, 1000, 1000, 0, 0]; % initial condition (S E I Q R)
    [tSol, YSol] = ode45(model_ode, period, Y0);
    T = [T; tSol];
    Eff = [Eff; eff .* ones(length(tSol), 1)];
    S = [S; YSol(:, 1)];
    E = [E; YSol(:, 2)];
    I = [I; YSol(:, 3)];
    Q = [Q; YSol(:, 4)];
    R = [R; YSol(:, 5)];
end

% plot 3D figures
three_dim_plot('S', T, Eff, S, 3, 3, 5);
three_dim_plot('E', T, Eff, E, 3, 3, 6);
three_dim_plot('I', T, Eff, I, 3, 3, 7);
three_dim_plot('Q', T, Eff, Q, 3, 3, 8);
three_dim_plot('R', T, Eff, R, 3, 3, 9);



