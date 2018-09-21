clear all

Read;

sv = zeros(10000,1);
A1 = zeros(1000,1);
Loss = zeros(1000,1);
X = MinMax(TIME, SL, EEG, BP, HR, CIRCLUATION);

D = [ 1 0 0 0 0 0;
      0 1 0 0 0 0;
      0 0 1 0 0 0;
      0 0 0 1 0 0;
      0 0 0 0 1 0;
      0 0 0 0 0 1;
    ];

W1 = rand(12,6)/sqrt(12/6);
W2 = rand(12,12)/sqrt(12/12);
W3 = rand(12,12)/sqrt(12/12);
W4 = rand(6,12)/sqrt(6/12);

for epoch = 1:1000 %train
    [W1 W2 W3 W4 delta] = DeepReLU(W1, W2, W3, W4, X, D);
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
    disp(mean(delta.^2));
    disp(Accuracy(sv, ACTIVITY));
    A1(epoch) = Accuracy(sv, ACTIVITY);
    Loss(epoch) = mean(delta.^2);
end

subplot(2,1,1);
plot(A1,'r')
xlabel('Epoch')
ylabel('Accuracy')

subplot(2,1,2);
plot(Loss, 'b')
xlabel('Epoch')
ylabel('Loss')