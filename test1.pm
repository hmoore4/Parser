

program test1

    i, j, k : int
    a, b : bool

begin
    
    read("%d %d %d", i, j, k)

    while (i != 0 || j != 0)

        write("\ni = %d, j = %d, k = %d\n", i, j, k)


        if (i > 10.0 || i < 1.1 && k == 0) then
            write("i = %d\n", i)
        elif (j > 10.0 && k == 0 || j < 1.5) then
            write("j = %d\n", j)
        else
            write("k = %d\n", k)

        end
        write("end of if\n")

        if (i > 10 || i < 1 && k == 0) then
            write("i = %d\n", i)
        elif (j > 10 && k == 0 || j < 1) then
            write("j = %d\n", j)
        else
            write("k = %d\n", k)
        end
        write("end of if\n")
            
        if (i > 0) then
            a = true
        else
            a = false
        end

        if (j > 0) then
            b = true
        else
            b = false
        end

        if (a) then
            write("i is positive\n")
        elif (a && b) then
            write("i and j are positive\n")
        elif (a || b) then
            write("i or j is positive\n")
        elif (!b) then
            write("j is negative\n")
        else
            write("i don't know\n")
        end
        read("%d %d %d", i, j, k)
        

    end
end
