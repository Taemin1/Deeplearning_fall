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

W1 = 2*rand(5,6)-1;
W2 = 2*rand(5,5)-1;
W3 = 2*rand(5,5)-1;
W4 = 2*rand(6,5)-1;

for epoch = 1:1000 %train
    [W1 W2 W3 W4] = DeepReLU(W1, W2, W3, W4, X, D);
    es = 0;
    
    N=10000; %inference
    for k = 1:N
        x=X(k,:)';
        
        v1=W1*x;
        y1=ReLU(v1);
        
        v2=W2*y1;
        y2=ReLU(v1);
        
        v3=W3*y2;
        y3=ReLU(v1);
        
        v=W4*y3;
        y=Softmax(v);
        %disp(k);
        %disp(y);
        sv(k) = Decoder(y);
        %disp(Decoder(y));
    end
    disp(epoch);
    disp(Accuracy(sv, ACTIVITY));
    A1(epoch) = Accuracy(sv, ACTIVITY);
end

plot(A1, 'r')
xlabel('Epoch')
ylabel('Accuracy')
