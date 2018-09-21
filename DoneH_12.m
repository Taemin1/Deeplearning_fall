
Read;

sv = zeros(10000,1);
A1 = zeros(100,1);
X = MinMax(TIME, SL, EEG, BP, HR, CIRCLUATION);

D = [ 1 0 0 0 0 0;
      0 1 0 0 0 0;
      0 0 1 0 0 0;
      0 0 0 1 0 0;
      0 0 0 0 1 0;
      0 0 0 0 0 1;
    ];

W1 = 2*rand(12,6)-1;
W2 = 2*rand(6,12)-1;

for epoch = 1:100 %train
    [W1 W2] = MultiClass(W1, W2, X, D);
    es = 0;
    
    N=10000; %inference
    for k = 1:N
        x=X(k,:)';
        v1=W1*x;
        y1=Sigmoid(v1);
        v=W2*y1;
        y=Softmax(v);
        %disp(k);
        %disp(y);
        sv(k) = Decoder(y);
        %disp(Decoder(y));
    end
    A1(epoch) = Accuracy(sv, ACTIVITY);
end

plot(A1, 'r')
xlabel('Epoch')
ylabel('Accuracy')
