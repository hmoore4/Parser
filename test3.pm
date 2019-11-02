/* test3.pm -- testing array and record as value parameters */

program test3

    t = array[1:10] of int
    rr = record
        a : int
        b : int
        c : record
            d : int
            e : int
            x : record 
                a : int 
                end
            end
        end
    r : rr
    i, j : int
    a : t

    procedure p(b : t; c : rr)
        i : int
    begin
        write("\nafter change in p\n")
        for i in 1:10
            b[i] = -b[i]
            write("b[%d] = %d\n", i, b[i])
        end

        c.a = -c.a
        c.b = -c.b
        c.c.d = -c.c.d
        c.c.x.a = -c.c.x.a
        write("c.a = %d\n", c.a)
        write("c.b = %d\n", c.b)
        write("c.c.d = %d\n", c.c.d)
        write("c.c.x.a = %d\n", c.c.x.a)
    end

begin
    
    for i in 1:10
        a[i] = i
    end

    for i in 1:10
        write("a[%d] = %d\n", i, a[i])
    end

    r.a = 100
    r.b = 101
    r.c.d = 102
    r.c.x.a = 103
    write("r.a = %d\n", r.a)
    write("r.b = %d\n", r.b)
    write("r.c.d = %d\n", r.c.d)
    write("r.c.x.a = %d\n", r.c.x.a)
    p(a,r)
    write("\nafter call\n")
    for i in 1:10
        write("a[%d] = %d\n", i, a[i])
    end
    write("r.a = %d\n", r.a)
    write("r.b = %d\n", r.b)
    write("r.c.d = %d\n", r.c.d)
    write("r.c.x.a = %d\n", r.c.x.a)

end

