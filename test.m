A = input("Enter tha value for factor: ");
tf = isa(A,'double');
if(tf && A>-1)
    x = mod(A,1);
    if (x == 0)
    disp('It is an integer!')
    end
end