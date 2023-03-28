data = load('Log_Teleoperation_Joystick.txt');

t = data(:,1) - data(1,1);
pL = data(:,2:4);
pR = data(:,5:7);
qL = data(:,8:11);
qR = data(:,12:15);


figure(1)
subplot(2,1,1), plot(t, pL, 'LineWidth', 2)
hold on
grid on
title('LEFT ARM TCP POSITION')
legend('X', 'Y', 'Z')
ylabel('p_L [m]')
subplot(2,1,2), plot(t, pR, 'LineWidth', 2)
hold on
grid on
title('RIGHT ARM TCP POSITION')
legend('X', 'Y', 'Z')
ylabel('p_R [m]')
xlabel('time [s]')


figure(2)
subplot(2,1,1), plot(t, qL, 'LineWidth', 2)
hold on
grid on
title('LEFT ARM JOINT POSITION')
legend('q_1', 'q_2', 'q_3', 'q_4')
ylabel('q_L [deg]')
subplot(2,1,2), plot(t, qR, 'LineWidth', 2)
hold on
grid on
title('RIGHT ARM JOINT POSITION')
legend('q_1', 'q_2', 'q_3', 'q_4')
ylabel('q_R [deg]')
xlabel('time [s]')


figure(3)
plot(pL(:,2) + 0.16, pL(:,3), 'LineWidth', 2, 'Color', 'b')
hold on
grid on
plot(pR(:,2) - 0.16, pR(:,3), 'LineWidth', 2, 'Color', 'g')
xlabel('Y [m]')
ylabel('Z [m]')
title('YZ PLANE TCP LEFT AND RIGHT ARMS')


figure(4)
plot3(pL(:,1), pL(:,2) + 0.16, pL(:,3), 'LineWidth', 2, 'Color', 'b')
hold on
grid on
plot3(pR(:,1), pR(:,2) - 0.16, pR(:,3), 'LineWidth', 2, 'Color', 'g')


% DRAW BOX
y1 = -0.2:0.01:0.2;
x1 = 0.37*ones(size(y1));
z1 = -0.18*ones(size(y1));
plot3(x1, y1, z1, 'LineWidth', 4, 'Color', 'k')				% Line Y-Front-Up
plot3(x1, y1, z1 - 0.2, 'LineWidth', 4, 'Color', 'k')		% Line Y-Front-Down
plot3(x1 + 0.2, y1, z1, 'LineWidth', 4, 'Color', 'k')		% Line Y-Back-Up
plot3(x1 + 0.2, y1, z1 - 0.2, 'LineWidth', 4, 'Color', 'k')	% Line Y-Back-Down

z2 = -0.38:0.01:-0.18;
x2 = 0.37*ones(size(z2));
y2 = 0.2*ones(size(z2));
plot3(x2, y2, z2, 'LineWidth', 4, 'Color', 'k')				% Line Z-Left-Front
plot3(x2, -y2, z2, 'LineWidth', 4, 'Color', 'k')			% Line Z-Right-Front
plot3(x2 + 0.2, y2, z2, 'LineWidth', 4, 'Color', 'k')		% Line Z-Left-Back
plot3(x2 + 0.2, -y2, z2, 'LineWidth', 4, 'Color', 'k')		% Line Z-Right-Back

x3 = 0.37:0.01:0.57;
y3 = 0.2*ones(size(z2));
z3 = -0.18*ones(size(z2));
plot3(x3, y3, z3, 'LineWidth', 4, 'Color', 'k')					% Line X-Left-Up
plot3(x3, -y3, z3, 'LineWidth', 4, 'Color', 'k')				% Line X-Right-Up
plot3(x3, y3, z3 - 0.2, 'LineWidth', 4, 'Color', 'k')			% Line X-Left-Down


plot3(x3, -y3, z3 - 0.2, 'LineWidth', 4, 'Color', 'k')			% Line X-Right-Down


