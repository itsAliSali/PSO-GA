function x = decode(a, bounds, integer_enable)

for i=1:length(bounds(:,1))
    temp = bi2de(a(1+16*(i-1):16*i));
    if temp == 2^16-1
        temp = 2^16;
    end
    x(i) = (( temp /(2^16))*(bounds(i,2)-bounds(i,1))) + bounds(i,1);
end

if integer_enable == 1
    x = round(x);
end

end

