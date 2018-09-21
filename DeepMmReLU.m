function [W1, W2, W3, W4] = DeepMmReLU(W1, W2, W3, W4, X, D)
    alpha = 0.01;
    beta = 0.01;

    mmt1 = zeros(size(W1));
    mmt2 = zeros(size(W2));
    mmt3 = zeros(size(W3));
    mmt4 = zeros(size(W4));
    
    ACTIVITY = csvread('C:/falldeteciton.csv',1,0, [ 1 0 10000 0]);
    N=10000;
    for k=1:N
        x=X(k,:)';
        v1=W1*x;
        y1=ReLU(v1);

        v2=W2*y1;
        y2=ReLU(v2);

        v3=W3*y2;
        y3=ReLU(v3);

        v=W4*y3;
        y=Softmax(v);

        d=D(ACTIVITY(k) + 1,:)';

        e=d-y;
        delta = e;

        e3 = W4'*delta;
        delta3=(v3>0).*e3;

        e2 = W3'*delta3;
        delta2=(v2>0).*e2;

        e1 = W2'*delta2;
        delta1=(v1>0).*e1;

        dW4=alpha*delta*y3';
        mmt4 = dW4 + beta*mmt4;
        W4 = W4+mmt4;

        dW3=alpha*delta3*y2';
        mmt3=dW3 + beta*mmt3;
        W3=W3+mmt3;

        dW2=alpha*delta2*y1';
        mmt2=dW2 + beta*mmt2;
        W2=W2+mmt2;

        dW1=alpha*delta1*x';
        mmt1=dW1 + beta*mmt1;
        W1=W1+mmt1;
    end
end
