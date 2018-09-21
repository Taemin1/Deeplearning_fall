function ac = Accuracy(a,b)
count = 0;
for k=1:10000
    if(a(k)==b(k))
        count=count+1;
    end
end
ac = count/10000;