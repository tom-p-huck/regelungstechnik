% Parameter
Fs = 1000;            % Abtastfrequenz [Hz]
T = 22;               % Gesamtdauer [s]
t = linspace(0,T,Fs*T);  % Zeitvektor

% Frequenz-Sweep (linear von f0 bis f1)
f0 = 0.1;    % Startfrequenz [Hz]
f1 = 2;      % Endfrequenz [Hz]
k = (f1 - f0)/T;  % Steigung der Frequenz im Sweep

% Instantane Frequenz zum Zeitpunkt t
f_t = f0 + k*t;

% Phasen des Eingangssignals (integriert Frequenz)
phi_in = 2*pi * (f0*t + 0.5*k*t.^2);

% Eingangssignal mit konstanter Amplitude 100
amp_in = 100;
x_in = amp_in * sin(phi_in);

% Ausgangssignal - Phasenversetztes und gedämpftes Signal
% Beispiel: Phasenverschiebung (kontinuierlich wachsend) und Amplitudendämpfung
phase_offset = pi/4;            % konstanter Phasenversatz (45 Grad)
amplitude_damping = linspace(1,0.6,length(t));  % Dämpfung von 1 auf 0.6 linear

% Ausgangssignal
x_out = amplitude_damping .* amp_in .* sin(phi_in - phase_offset);

% Basis-Offset (Position in mm), damit Linien im Plot nicht um 0 schwanken
offset = 625;  

% Plot
figure('Position',[100 100 900 400])
plot(t, x_in + offset, 'b', 'LineWidth', 1.5)
hold on
plot(t, x_out + offset, 'r', 'LineWidth', 1.5)
hold off
grid on

xlabel('Zeit in s', 'FontSize', 14)
ylabel('Position in mm', 'FontSize', 14)
title('Frequenz-Sweep Eingang (blau) und gedämpftes Ausgangssignal (rot)', 'FontSize', 16)
legend('Eingangssignal', 'Ausgangssignal', 'Location', 'northeast')

% Optische Anpassungen
ylim([500 750])
set(gca,'FontSize',14)