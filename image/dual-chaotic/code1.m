clc, clear all
close all;
% ԭʼͼ���ֱ��ͼ����
A = imread('Lena.png');
B = imread('Horse.png');
C = imread('Relief.png');
D = imread('Cameraman.png');
A = double(A);
B = double(B);
C = double(C);
D = double(D);

figure(1);
histogram(A(:), 256, 'FaceColor', 'b', 'EdgeColor', 'b');
xlabel('Pixel value','fontsize',22);  % ���ú�����
ylabel('Frequency','fontsize',22);  % ����������
set(gca,'fontsize',22);
%ylim([0 600]);  % �������귶Χ����Ϊ 0 �� 600
figure(2);
histogram(B(:), 256, 'FaceColor', 'b', 'EdgeColor', 'b');
xlabel('Pixel value','fontsize',22);  % ���ú�����
ylabel('Frequency','fontsize',22);  % ����������
set(gca,'fontsize',22);
%ylim([0 600]);  % �������귶Χ����Ϊ 0 �� 600
figure(3);
histogram(C(:), 256, 'FaceColor', 'b', 'EdgeColor', 'b');
xlabel('Pixel value','fontsize',22);  % ���ú�����
ylabel('Frequency','fontsize',22);  % ����������
set(gca,'fontsize',22);
ylim([0 10*10e2]);  % �������귶Χ����Ϊ 0 �� 600
figure(4);
histogram(D(:), 256, 'FaceColor', 'b', 'EdgeColor', 'b');
xlabel('Pixel value','fontsize',22);  % ���ú�����
ylabel('Frequency','fontsize',22);  % ����������
set(gca,'fontsize',22);
%ylim([0 600]);  % �������귶Χ����Ϊ 0 �� 600