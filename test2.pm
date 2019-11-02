

program test2

    n : int

    function fact(i : int) : int
    begin
        if (i == 1) then
            return 1
        else
            return i * fact(i-1)
        end
    end

begin
    
    for n in 1:10
        write("%d! = %d\n", n, fact(n))
    end

end
