close all;

% Parameter
t = linspace(0, 20, 500);
Tu = 3;    
Tg = 10;   
Y_end = 1; 

% Signal (sigmoid als Beispiel)
y = Y_end ./ (1 + exp(-0.8*(t - (Tu + Tg/2)))); 

% Tangentenberechnung
dy = gradient(y, t(2)-t(1));
[max_slope, i_max] = max(dy);
t0 = t(i_max);
y0 = y(i_max);
y_tang = max_slope * (t - t0) + y0;
t_end_tang = (Y_end - y0)/max_slope + t0;
t_u = t0 - y0/max_slope;

% Pfeil-Parameter
arrowYpos = 0.09;          % vertikale Höhe der Pfeile (gleich für beide)
arrowWidth_Tu = 0.072;     % halbe Breite Pfeil T_u
arrowXoffset_Tu = 0.035;     % horizontaler Offset Pfeil T_u
arrowWidth_Tg = 0.055;      % halbe Breite Pfeil T_g
arrowXoffset_Tg = 0.16;    % horizontaler Offset Pfeil T_g

figure('Position',[100 100 700 500])
hold on

% Plots
plot(t, y, 'b-', 'LineWidth', 3)
plot(t, y_tang, 'r-', 'LineWidth', 2)
plot([0 max(t)], [Y_end Y_end], 'g-', 'LineWidth', 2)
plot(t0, y0, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8)
plot([t_end_tang t_end_tang], [0 Y_end], 'r--', 'LineWidth', 1.5)
% plot([0 t0], [y0 y0], 'b--', 'LineWidth', 1.5) % optional

% X-Achse bei y=0 als dicke Linie zeichnen
plot([0 max(t)], [0 0], 'k-', 'LineWidth', 2)

% Pfeil Tu
annotation('doublearrow', ...
    [(t_u / max(t))*0.6 + arrowXoffset_Tu - arrowWidth_Tu, (t0 / max(t))*0.6 + arrowXoffset_Tu + arrowWidth_Tu], ...
    [arrowYpos arrowYpos], 'Color','r', 'LineWidth',1.5);
text(3, -0.08, 'T_u','Color','r', 'FontSize', 14, 'HorizontalAlignment', 'center')

% Pfeil Tg
annotation('doublearrow', ...
    [(t0 / max(t))*0.6 + arrowXoffset_Tg - arrowWidth_Tg, (t_end_tang / max(t))*0.6 + arrowXoffset_Tg + arrowWidth_Tg], ...
    [arrowYpos arrowYpos], 'Color','r', 'LineWidth',1.5);
text(8, -0.08, 'T_g','Color','r', 'FontSize', 14, 'HorizontalAlignment', 'center')

% Remove default axis labels
% xlabel('t', 'FontSize', 16, 'FontWeight', 'bold')
% ylabel('y(t)', 'FontSize', 16, 'FontWeight', 'bold')

% Add customized axis labels at axis ends
text(max(t)*0.99, -0.075, 't', 'FontSize', 16, 'FontWeight', 'bold', ...
    'HorizontalAlignment', 'right', 'VerticalAlignment', 'top')

text(-0.8, Y_end + 0.15, 'y(t)', 'FontSize', 16, 'FontWeight', 'bold', ...
    'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle', 'Rotation', 90)

ax = gca;
ax.XColor = 'k';  
ax.YColor = 'k';
ax.LineWidth = 1.5;

% Remove tick labels on both axes
ax.XTickLabel = [];
ax.YTickLabel = [];

% Achsenlimits – unteren y-Wert auf 0 setzen
ylim([0 Y_end + 0.2])
xlim([0 max(t)])

% Achsenpfeile
plot([max(t)*0.97 max(t)*1.03], [0 0], 'k-', 'LineWidth', 1.5)
plot([max(t) max(t)*1.03], [0 0.05], 'k-', 'LineWidth', 1.5)
plot([max(t) max(t)*1.03], [0 -0.05], 'k-',  'LineWidth', 1.5)

plot([0 0], [Y_end*0.97 Y_end*1.03], 'k-', 'LineWidth', 1.5)
plot([-0.15 0], [Y_end*1.03 Y_end*1.05], 'k-', 'LineWidth', 1.5)
plot([0.15 0], [Y_end*1.03 Y_end*1.05], 'k-',  'LineWidth', 1.5)

box off
hold off