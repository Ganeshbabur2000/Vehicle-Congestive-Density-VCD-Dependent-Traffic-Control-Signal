function match=matchh(BW1,BW2)
match=0;
for p = 1 : 512
 for q = 1 : 512
 if (BW1(p, q) == BW2(p,q))
 match = match +1;
 end
 end
end
