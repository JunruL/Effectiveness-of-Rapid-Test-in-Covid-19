function three_dim_plot(group, T, Alphas, Population, sub1, sub2, sub3)
    % set the density of the surface (x, y for graph)
    [Tq,Alphasq] = meshgrid(0:5:200, 0:.1:1);
    % get z for graph
    Populationq = griddata(T,Alphas,Population,Tq,Alphasq);
    % do a subplot
    subplot(sub1, sub2, sub3);
    mesh(Tq,Alphasq,Populationq);
    title(group);
    xlabel('time (days)');
    ylabel('Effectiveness');
    zlabel('Population');
end