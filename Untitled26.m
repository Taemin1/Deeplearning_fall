clear all

Read;

sv = zeros(10000,1);
A1 = zeros(1000,1);
X = MinMax(TIME, SL, EEG, BP, HR, CIRCLUATION);

D = [ 1 0 0 0 0 0;
      0 1 0 0 0 0;
      0 0 1 0 0 0;
      0 0 0 1 0 0;
      0 0 0 0 1 0;
      0 0 0 0 0 1;
    ];

W1 = 2*rand(20,6)-1;
W2 = 2*rand(20,20)-1;
W3 = 2*rand(20,20)-1;
W4 = 2*rand(6,20)-1;

b1 = 2*rand(20,1)-1;
b2 = 2*rand(20,1)-1;
b3 = 2*rand(20,1)-1;
b4 = 2*rand(6,1)-1;
% W1 = rand(20,6);
% W2 = rand(20,20);
% W3 = rand(20,20);
% W4 = rand(6,20);
% 
% b1 = rand(20,1);
% b2 = rand(20,1);
% b3 = rand(20,1);
% b4 = rand(6,1);
for epoch = 1:1000 %train
    [W1 W2 W3 W4 b1 b2 b3 b4] = DeepReLU_Bias(W1, W2, W3, W4, b1,b2,b3,b4, X, D);
    es = 0;
    
    N=10000; %inference
    for k = 1:N
        x=X(k,:)';
        
        v1=W1*x +b1;
        y1=ReLU(v1);
        
        v2=W2*y1 +b2;
        y2=ReLU(v1);
        
        v3=W3*y2 +b3;
        y3=ReLU(v1);
        
        v=W4*y3 +b4;
        y=Softmax(v);
      
        sv(k) = Decoder(y);
        %disp(Decoder(y));
    end
    
    disp(epoch);
    disp(v);
    disp(Accuracy(sv, ACTIVITY));
    A1(epoch) = Accuracy(sv, ACTIVITY);
end

plot(A1, 'r')
xlabel('Epoch')
ylabel('Accuracy')
