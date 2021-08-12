function IG1=pltr(IR1)
c = 1;g = 0.9;
for p = 1 : 512
    for q = 1 : 512
        IG1(p, q) = c * IR1(p, q).^ g;
    end
end
