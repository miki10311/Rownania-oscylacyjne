clear all;
close all;
hold on;

ksi=[0.9, 0.4, 0.9, 0.4];
wn=[(2/0.9), 1, 1, 5];
kolory=['r- ';'g--';'b- ';'m--'];
kropki=['r.';'g.';'b.';'m.'];

for a=1:1:4

u0=0;
du=1;
biegun1=(-2*ksi(a)*wn(a)+sqrt(4*ksi(a)*wn(a)*wn(a)-4*wn(a)*wn(a)))/2;
biegun2=(-2*ksi(a)*wn(a)-sqrt(4*ksi(a)*wn(a)*wn(a)-4*wn(a)*wn(a)))/2;

subplot(122)
hold on;
grid on;
p1(a) = plot(real(biegun1), imag(biegun1), kropki(a,:),'MarkerSize',40)
plot(real(biegun2), imag(biegun2), kropki(a,:),'MarkerSize',40)

title('Bieguny')
xlabel('REALIS')
ylabel('IMAGINARIA')

x0=0;
x10=0;
sim('schemat_osc',20)

subplot(121)
hold on;
grid on;
plot(ans.tout, ans.x, kolory(a,:))
legend('1','2','3','4');
title('Odpowiedź skokowa')
xlabel('CZAS [s]')
ylabel('WARTOŚCI')
end


for a=1:1:2
subplot(122)
hold on;
grid on;
t=[-3:0.1:0.2];
y1=ksi(a)*wn(a)*t;
y2=-ksi(a)*wn(a)*t;
plot(t,y1,'k:')
plot(t,y2,'k:')
end

t=[0:0.1:20];
poziom=t;
poziom(:)=1;
subplot(1,2,1)
hold on;
grid on;
plot(t,poziom,'k:')


t=[-3:0.1:0.2];
poziom=t;
poziom(:)=0;
subplot(1,2,2)
hold on;
grid on;
plot(t,poziom,'k:')

subplot(1,2,2)
hold on;
grid on;
y=[-6:0.1:6];
x=zeros(size(y));
plot(x,y,'k:');

subplot(1,2,2)
hold on;
grid on;
y=[-6:0.1:6];
x=-2*ones(size(y));
plot(x,y,'k:');


r = wn(2);
a = 0;
b = 0;
t = linspace(0,2*pi,200);
x = a+r*cos(t);
y = b+r*sin(t);
plot(x,y,'k:');
legend([p1(1) p1(2) p1(3) p1(4)],{'1','2','3','4'})


t=[0:0.1:20];
poziom=t;
poziom(:)=1.253;
subplot(1,2,1)
hold on;
grid on;
plot(t,poziom,'r:')
legend('1','2','3','4','x0','h(t)','Location','southeast');

