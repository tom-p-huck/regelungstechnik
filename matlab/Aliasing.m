% Aliasing Illustration in MATLAB

% Parameter
f_orig = 23;          % Originalfrequenz in Hz (hochfrequent)
f_samp = 10;          % Abtastfrequenz in Hz
T = 1;                % Beobachtungsdauer (Sekunden)

% Zeitvektoren
t_cont = linspace(0, T, 1000);        % Zeit für kontinuierliches Signal
t_samp = 0:1/f_samp:T;                 % Abtastzeitpunkte

% Originalsignal (hochfrequent)
x_cont = sin(2*pi*f_orig*t_cont);

% Abgetastete Punkte
x_samp = sin(2*pi*f_orig*t_samp);

% Berechnung der Alias-Frequenz
k = round(f_orig / f_samp);
f_alias = abs(f_orig - k*f_samp);

% Alias-Signal mit niedrigerer Frequenz
x_alias = sin(2*pi*f_alias*t_cont);

% Plot
figure; hold on; grid on; box on;

% Originalsignal blau
plot(t_cont, x_cont, 'b', 'LineWidth', 2);

% Abtastpunkte rot (größer und dicker)
plot(t_samp, x_samp, 'ro', 'MarkerSize', 12, 'MarkerFaceColor', 'r');

% Alias-Schwingung rot gestrichelt (dicker)
plot(t_cont, x_alias, 'r--', 'LineWidth', 3);

xlabel('Zeit [s]');
ylabel('Amplitude');
title('Aliasing-Illustration');
legend('Originalsignal (hochfrequent)', 'Abtastpunkte', 'Aliased Signal (niedrigere Frequenz)', 'Location', 'best');

xlim([0 T]);
ylim([-1.2 1.2]);