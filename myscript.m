frequency = 3; % Change frequency in Hz
t = linspace(0, 1, 1000);
plot(t, sin(2*pi*frequency*t), 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title(sprintf('Sine Wave (%.2f Hz)', frequency));

