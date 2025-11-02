figure('Position',[100 100 700 500])
hold on

% Achsenlimits
xlim([-8 4])
ylim([-4 4])

% Gitterlinien (feine gestrichelte Linien im Abstand 2)
x_grid = -8:2:4;
y_grid = -4:2:4;

for x = x_grid
    if x == 0
        plot([x x], ylim, 'k-', 'LineWidth', 2) % dicke Achse
    else
        plot([x x], ylim, 'k--', 'LineWidth', 0.8) % gestrichelt
    end
end

for y = y_grid
    if y == 0
        plot(xlim, [y y], 'k-', 'LineWidth', 2) % dicke Achse
    else
        plot(xlim, [y y], 'k--', 'LineWidth', 0.8) % gestrichelt
    end
end

% Pole (×) – Beispielwerte
poles_real = [-6, -3-3i, -3+3i];
plot(real(poles_real), imag(poles_real), 'bx', 'MarkerSize', 16, 'LineWidth', 3)

% Nullstellen (o) – Beispielwerte
zeros_real = [-2+0i];
plot(real(zeros_real), imag(zeros_real), 'bo', 'MarkerSize', 16, 'LineWidth', 3)

% Achsenbeschriftungen
xlabel('Re(s)', 'FontSize', 14)
ylabel('Im(s)', 'FontSize', 14)

% Box ausschalten, Achsen in der Mitte
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

% Achsenticks passend setzen
ax.XTick = x_grid;
ax.YTick = y_grid;

axis equal
grid off
hold off