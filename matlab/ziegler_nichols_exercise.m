K = 0.4;          % System gain
T = 30;           % Characteristic time
zeta = 1.5;       % Overdamped, no overshoot
L = 2;            % Dead time (delay)

wn = 1/T;         % Natural frequency

s = tf('s');
G_nodelay = K*wn^2/(s^2 + 2*zeta*wn*s + wn^2);
G = G_nodelay * exp(-L*s);

% Step response plot with longer time vector (0 to 500 seconds)
tFinal = 500;
figure;
step(G, 0:0.01:tFinal);
title('Step Response');
grid on;

% Set x-axis ticks every 10 seconds
xticks(0:10:tFinal);

% Increase line width
hLine = findobj(gca, 'Type', 'line');  % Find all lines in current axes
set(hLine, 'LineWidth', 2);             % Set line width to 2 (thicker)