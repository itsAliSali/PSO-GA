function output = code (input , bounds)

output =[];
a = (input-bounds(:,1))./(bounds(:,2)-bounds(:,1));
a = round(a./(0.5^16));

for i= 1:length(input)
    if a(i)==2^16
        a(i)=2^16-1;
    end
    output = [output , de2bi(a(i),16)];
end

end