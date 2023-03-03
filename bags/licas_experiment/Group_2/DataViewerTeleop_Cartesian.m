data = load('Log_Teleoperation_Cartesian.txt');

t = data(:,1) - data(1,1);
qLref = data(:,2:5);
qL = data(:,6:9);
qLgripper = data(:,10);
qRref = data(:,11:14);
qR = data(:,15:18);
qRgripper = data(:,19);
pLref = data(:,20:22);
pRref = data(:,23:25);
pL = data(:,26:28);
pR = data(:,29:31);


% Plot left arm joint space data
figure(1)
for k = 1:4
	subplot(4,1,k), plot(t, qLref(:,k), 'LineWidth', 2);
	hold on
	grid on
	subplot(4,1,k), plot(t, qL(:,k), 'LineWidth', 2);
	if k == 1
		title('LEFT ARM JOINT REFERENCE AND FEEDBACK');
		ylabel('q_1 [deg]')
	elseif k == 2
		ylabel('q_2 [deg]')
	elseif k == 3
		ylabel('q_3 [deg]')
	elseif k == 4
		ylabel('q_4 [deg]')
		xlabel('time [s]')
	end
end


% Plot right arm joint space data
figure(2)
for k = 1:4
	subplot(4,1,k), plot(t, qRref(:,k), 'k', 'LineWidth', 2);
	hold on
	grid on
	subplot(4,1,k), plot(t, qR(:,k), 'b', 'LineWidth', 2);
	if k == 1
		title('RIGHT ARM JOINT REFERENCE AND FEEDBACK');
		ylabel('q_1 [deg]')
	elseif k == 2
		ylabel('q_2 [deg]')
	elseif k == 3
		ylabel('q_3 [deg]')
	elseif k == 4
		ylabel('q_4 [deg]')
		xlabel('time [s]')
	end
end


% Plot left arm Cartesian position
figure(3)
for k = 1:3
	subplot(3,1,k), plot(t, 100*pLref(:,k), 'k', 'LineWidth', 2);
	hold on
	grid on
	subplot(3,1,k), plot(t, 100*pL(:,k), 'b', 'LineWidth', 2);
	if k == 1
		title('LEFT ARM CARTESIAN REFERENCE AND FEEDBACK');
		ylabel('X [cm]')
	elseif k == 2
		ylabel('Y [cm]')
	elseif k == 3
		ylabel('Z [cm]')
		xlabel('time [s]')
	end
end


% Plot right arm Cartesian position
figure(4)
for k = 1:3
	subplot(3,1,k), plot(t, 100*pRref(:,k), 'k', 'LineWidth', 2);
	hold on
	grid on
	subplot(3,1,k), plot(t, 100*pR(:,k), 'b', 'LineWidth', 2);
	if k == 1
		title('RIGHT ARM CARTESIAN REFERENCE AND FEEDBACK');
		ylabel('X [cm]')
	elseif k == 2
		ylabel('Y [cm]')
	elseif k == 3
		ylabel('Z [cm]')
		xlabel('time [s]')
	end
end


% Plot left/right Cartesian error
figure(5)
subplot(2,1,1), plot(t, 100*(pLref(:,1:3) - pL(:,1:3)), 'LineWidth', 2)
hold on
grid on
v = axis;
v(3) = -25;
v(4) = 25;
axis(v);
title('LEFT ARM CARTESIAN ERROR')
ylabel('error [cm]')
legend('X', 'Y', 'Z')
subplot(2,1,2), plot(t, 100*(pRref(:,1:3) - pR(:,1:3)), 'LineWidth', 2)
hold on
grid on
v = axis;
v(3) = -20;
v(4) = 20;
axis(v);
title('RIGHT ARM CARTESIAN ERROR')
ylabel('error [cm]')
legend('X', 'Y', 'Z')
xlabel('time [s]')


% Plot norm of left/right end effectors
figure(6)

dLref = zeros(size(t));
dL = zeros(size(t));
dRref = zeros(size(t));
dR = zeros(size(t));

for k = 1:length(t)
	dLref(k) = norm(pLref(k,1:3));
	dL(k) = norm(pL(k,1:3));
	dRref(k) = norm(pRref(k,1:3));
	dR(k) = norm(pR(k,1:3));
end

subplot(2,1,1), plot(t, 100*dLref, 'k', 'LineWidth', 2)
hold on
grid on
subplot(2,1,1), plot(t, 100*dL, 'b', 'LineWidth', 2)
title('LEFT ARM REACH')
legend('Reference', 'LiCAS')
ylabel('distance [cm]')
subplot(2,1,2), plot(t, 100*dRref, 'k', 'LineWidth', 2)
hold on
grid on
subplot(2,1,2), plot(t, 100*dR, 'b', 'LineWidth', 2)
title('RIGHT ARM REACH')
legend('Reference', 'LiCAS')
ylabel('distance [cm]')
xlabel('time [s]')


% Plot projection
figure(7)
% plot(100*(pL(:,2) + 0.16), 100*pL(:,3), 'b', 'LineWidth', 2)
plot(pL(:,2) + 0.16, pL(:,3))
hold on
grid on
% plot(100*(pR(:,2) + 0.16), 100*pR(:,3), 'g', 'LineWidth', 2)
plot(pR(:,2) - 0.16, pR(:,3))
title('YZ AXES LEFT/RIGHT ARMS')
ylabel('Z [cm]')
xlabel('Y [cm]')
legend('LEFT ARM', 'RIGHT ARM')
v = axis;
v(1) = -0.5;
v(2) = 0.5;
v(3) = -0.5;
v(4) = 0;
axis(v);


% LEFT/RIGHT TCP POSITION 3D
figure(8)
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

title('LEFT/RIGHT ARMS TCP POSITION')

