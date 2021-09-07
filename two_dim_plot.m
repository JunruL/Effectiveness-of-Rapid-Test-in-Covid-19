function two_dim_plot(eff, title_name, sub1, sub2, sub3)
    % set para here
    para = [1000 750 0.02 0.05 0.2 0.05 1 eff];
    model_ode = @(t, Y) model(t, Y, para);
    period = [0 200]; % time period to investigate
    Y0 = [37740000, 1000, 1000, 0, 0]; % initial condition (S E I II R)
    [tSol, YSol] = ode45(model_ode, period, Y0); % get the solution
    % do a subplot
    subplot(sub1, sub2, sub3);
    plot(tSol, YSol);
    title(title_name);
    xlabel('time (days)');
    ylabel('population');
    legend('S', 'E', 'I', 'Q', 'R');
end