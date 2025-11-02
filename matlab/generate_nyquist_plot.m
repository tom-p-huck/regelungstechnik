% Parameter
g = 2;
zeta = 0.3;
wn = 1;

% Frequenzvektor
omega = logspace(-2,2,1000); % von 0.01 bis 100

s = 1i*omega/wn;
G = g ./ (1 + 2*zeta*s + s.^2);

% Real- und Imaginärteil
ReG = real(G);
ImG = imag(G);

% Nur unterer Teil (Imaginärteil <= 0)
idx_lower = ImG <= 0;

% Plot
figure('Position',[100 100 600 600])
plot(ReG(idx_lower), ImG(idx_lower), 'b-', 'LineWidth', 3)
hold on

% Kritischer Punkt markieren
% plot(-1,0,'ro','MarkerSize',10, 'LineWidth',2)
% text(-1, 0.05, 'Kritischer Punkt', 'Color', 'red', 'FontSize', 14, ...
%     'FontWeight', 'bold', 'HorizontalAlignment', 'center')

% Pfeil vom Ursprung zum Punkt für omega = 0.5 zeichnen
omega_pfeil = 0.5;
[~, idx_pfeil] = min(abs(omega - omega_pfeil));
x_pfeil = ReG(idx_pfeil);
y_pfeil = ImG(idx_pfeil);

% Pfeil zeichnen
quiver(0, 0, x_pfeil, y_pfeil, 0, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.3)

% Optional: Beschriftung für den Pfeil
text(x_pfeil, y_pfeil, '\omega=0.5', 'Color', 'red', 'FontSize', 14, ...
    'FontWeight', 'bold', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom')

grid on
axis equal
xlabel('Re\{G(j\omega)\}','FontSize',14)
ylabel('Im\{G(j\omega)\}','FontSize',14)
title('Unterer Teil der Ortskurve von G(j\omega)','FontSize',16,'FontWeight','bold')
set(gca, 'FontSize',14)

% Frequenzbeschriftungen im unteren Teil (optional)
freq_labels = [0.1 1 100];
for f = freq_labels
    [~, idx] = min(abs(omega - f));
    if ImG(idx) <= 0
        text(ReG(idx), ImG(idx), ['\omega=', num2str(f)], ...
            'FontSize',12, 'FontWeight','bold', 'Color','red', 'HorizontalAlignment','left')
    end
end

hold off