srfreq=48000;
%�˲�������
bandwith=30;
len=bandwith/30;
thetav=-len*0.2*pi:pi/(srfreq/(bandwith)):len*0.2*pi;
o=hanning(length(thetav));
o=o';
%���Ƶ�Ƶ��
freq=400;
tsin=sin(0:2*pi/(srfreq/freq):180*pi);
tsin=tsin(1:length(thetav));
shiftv=1;
t1=sinc(thetav*shiftv);   
%%�������˲���
%t1=t1.*t1;
%%�����Ӵ��˲���
t1=t1.*o;
t1=t1./sum(t1);
t1=t1.*tsin;
figure,plot(thetav/pi,abs(fftshift(fft(t1))))

%�˲�
a=audioread('tesca.wav');
adata=a(:,1);
y=filter(t1,1,adata);
audiowrite('o2.wav',y,48000);
