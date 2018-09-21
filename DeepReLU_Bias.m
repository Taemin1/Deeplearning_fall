function [W1, W2, W3, W4, b1, b2, b3, b4] = DeepReLU_Bias(W1, W2, W3, W4, b1, b2, b3, b4, X, D)
    alpha = 0.01;
    beta = 0.01;
    
    ACTIVITY = csvread('C:/falldeteciton.csv',1,0, [ 1 0 10000 0]);
    N=10000;
    for k=1:N
        x=X(k,:)';
        v1=W1*x + b1;
        y1=ReLU(v1);

        v2=W2*y1 + b2;
        y2=ReLU(v2);

        v3=W3*y2 + b3;
        y3=ReLU(v3);

        v=W4*y3 + b4;
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
        W4=W4+dW4;
        
        db4 = beta*delta;
        b4 = b4 + db4;

        dW3=alpha*delta3*y2';
        W3=W3+dW3;

        db3 = beta*delta3;
        b3 = b3 + db3;
        
        dW2=alpha*delta2*y1';
        W2=W2+dW2;

        db2 = beta*delta2;
        b2 = b2 + db2;
        
        dW1=alpha*delta1*x';
        W1 = W1+dW1;
        
        db1 = beta*delta1;
        b1 = b1 + db1;
    end
end
