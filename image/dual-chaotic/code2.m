clc, clear
close all;
% ���ܼ�����ͼ��ͳ����������
% ���ɻ������� z1 �� z2
z1 = improved_logistic_chaotic(4,7,0.2506,4,0.3245,0.3125,0.1045);
z2 = improved_logistic_chaotic(4,7,0.4506,4,0.6467,0.3813,0.2509);

% �� z2 ���д���
z2 = mod(floor(z2 * 10^15), 256); % �Ի�������z2����

% ��ȡͼ��ת��Ϊ˫��������
P = zeros(256,256); % �޸�����
figure(1)
imshow(P);

P = double(P);  % ת��Ϊ˫��������
figure(2)
histogram(P(:),256, 'FaceColor', 'b', 'EdgeColor', 'b');
xlabel('Pixel value','fontsize',22);  % ���ú�����
ylabel('Frequency','fontsize',22);  % ����������
set(gca,'fontsize',22);
ylim([0 20*10e2]);  % �������귶Χ����Ϊ 0 �� 600

% ����άͼ��չƽΪһά����
P1 = P(:);

% ��ͼ����л�������
[z1_sort, ind] = sort(z1);  % �������� z1 ���򲢻�ȡ����
for i = 1:256*256
Ps(ind(i)) = P1(i);  % ����
end
% ��ͼ�������ɢ
Pd = bitxor(uint8(Ps), uint8(z2));  % ������ɢ
% �ع����ܺ��ͼ��
C = reshape(Pd, [256, 256]);  % ��һά�����ع�Ϊ256x256
C = uint8(C);
imwrite(C,'EK_D.png')% png����ѹ��
figure(3);
imshow(C);

% ��ʾ����ͼ���ֱ��ͼ
C = double(C);
figure(4);
histogram(C(:), 256, 'FaceColor', 'b', 'EdgeColor', 'b');
xlabel('Pixel value','fontsize',22);  % ���ú�����
ylabel('Frequency','fontsize',22);  % ����������
set(gca,'fontsize',22);
ylim([0 600]);  % �������귶Χ����Ϊ 0 �� 600
% ����ӳ�亯��
function Z_values = improved_logistic_chaotic(T1, T2, p, mu0, x0, y0, z0)
    mu = mu0;
    X_n = x0;
    Y_n = y0;
    Z_n = z0;
    n = 0;
    Z_values = [];
    max_iterations = 256 * 256;
    
    while n < max_iterations
        Z_n1 = mu * Z_n * (1 - Z_n);
        if X_n <= p
            X_n1 = X_n / p;
            Y_n1 = p * X_n;
        else
            X_n1 = (X_n - p) / (1 - p);
            Y_n1 = Y_n * (1 - p) + 1 - p;
        end
        
        X_n = X_n1;
        Y_n = Y_n1;
        
        if mod(n, T1) == 0
            mu = function1(X_n);
        end
        
        if mod(n, T2) == 0
            Z_n = function2(Y_n);
        end
        
        Z_values = [Z_values, Z_n1];
        Z_n = Z_n1;
        n = n + 1;
    end
end

function mu = function1(X_n)
    mu = 3.5699 + (4 - 3.5699) * X_n;
    mu = min(max(mu, 3.5699), 4);
end

function Z_n = function2(Y_n)
    Z_n = Y_n;
    Z_n = min(max(Z_n, 0), 1);
end
