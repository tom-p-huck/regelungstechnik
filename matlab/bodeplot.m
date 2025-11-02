% Parameter (Beispiel für Resonanzsystem mit Durchtrittsfrequenz ~1)
g = 2;       % Anfangsverstärkung > 1
omega = logspace(-1,1,500); % Frequenz 0.1 bis 10

% Übertragungsfunktion G(jw) = g / (1 + 2*zeta*(j*w/wn) + (j*w/wn)^2)
% Wir setzen wn=1 für Normalisierung, Dämpfung zeta ~0.3 für Resonanz
zeta = 0.3;
wn = 1;
s = 1i*omega/wn;
G = g ./ (1 + 2*zeta*s + s.^2);

% Betrag und Phase
mag = abs(G);
phase = angle(G)*180/pi;

% Plot
figure('Position',[100 100 700 500])

% Betrag
subplot(2,1,1)
loglog(omega,mag,'LineWidth',3,'Color','b')
grid on
title('Bode-Diagramm von G(j\omega)','FontSize',16,'FontWeight','bold')
ylabel('|G(j\omega)|','FontSize',14)
set(gca,'FontSize',14)
xlim([0.1 10])
ylim([1e-1 10])  % Start oberhalb 1, deshalb y-Limit angepasst

% x-Achse Label erst im letzten Plot
set(gca, 'XTickLabel', [])

% Phase
subplot(2,1,2)
semilogx(omega, phase,'LineWidth',3,'Color','b')
grid on
xlabel('\omega','FontSize',14)
ylabel('\phi(G(j\omega)) [°]','FontSize',14)
xlim([0.1 10])
ylim([-180 20])
set(gca,'FontSize',14)
