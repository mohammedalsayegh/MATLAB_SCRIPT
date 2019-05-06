
x = linspace(-10,10,100);
y = zerocrossings(x);

% upward zero-crossings to nearest time step
upcross = find(y(1:end-1) <= 0 & y(2:end) > 0);
upcross_float = upcross - y(upcross) ./ (y(upcross+1)-y(upcross));
upcross_float = upcross_float - upcross; 
next_upcross = upcross + 1;
x_point_up = x(upcross) + -((x(upcross) - x(next_upcross)).*upcross_float)

% downward zero-crossings
downcross = find(y(1:end-1) >= 0 & y(2:end) < 0);
downcross_float = downcross - y(downcross) ./ (y(downcross+1)-y(downcross));
downcross_float = downcross_float - downcross;
next_downcross = downcross + 1;
x_point_down = x(downcross) + -((x(downcross) - x(next_downcross)).*downcross_float)

%%

y_down = interp1(x,y,x_point_down);
y_up = interp1(x,y,x_point_up);

%%
hold on;
subplot(2,1,1)
plot(x,y,x_point_up, y_up,'*',x_point_down, y_down,'v');
yline(0);
grid on;

subplot(2,1,2);
plot(x_point_up, y_up,'*',x_point_down, y_down,'v');
grid on;