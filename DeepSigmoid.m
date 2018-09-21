function [W1, W2, W3, W4] = DeepSigmoid(W1, W2, W3, W4, X, D)
    alpha = 0.01;

    ACTIVITY = csvread('C:/falldeteciton.csv',1,0, [ 1 0 10000 0]);
    N=10000;
    for k=1:N
        x=X(k,:)';
        v1=W1*x;
        y1=Sigmoid(v1);

        v2=W2*y1;
        y2=Sigmoid(v2);

        v3=W3*y2;
        y3=Sigmoid(v3);

        v=W4*y3;
        y=Softmax(v);

        d=D(ACTIVITY(k) + 1,:)';

        e=d-y;
        delta = e;

        e3 = W4'*delta;
        delta3=v3.*(1-v3).*e3;

        e2 = W3'*delta3;
        delta2=v2.*(1-v2).*e2;

        e1 = W2'*delta2;
        delta1=v1.*(1-v1).*e1;

        dW4=alpha*delta*y3';
        W4=W4+dW4;

        dW3=alpha*delta3*y2';
        W3=W3+dW3;

        dW2=alpha*delta2*y1';
        W2=W2+dW2;

        dW1=alpha*delta1*x';
        W1 = W1+dW1;
    end
end
