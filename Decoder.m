function num = Decoder(y)
max = 0;
num = 0;
for i=1:2
    if(y(i)>max)
        max=y(i);
        num=i;
    end
end
num = num-1;