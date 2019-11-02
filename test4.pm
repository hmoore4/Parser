/* test4.pm -- multidimensional array and nested data structures */

program test4
   
    r = record
        a : int
        b : int
        end

    c : array[1:10] of r
    a : array[1:5, 1:5] of int
    i, j : int

begin

    write("2-dim array\n")
    for i in 1:5
        for j in 1:5
            a[i,j] = i + j
            write("a[%d,%d] = %d\n", i, j, a[i,j])
        end
        write("\n")
    end

    write("\nnested data structure\n")
    for i in 1:10
        c[i].a = i
        c[i].b = -i
    end

    for i in 1:10
        write("c[%d].a = %d, c[%d].b = %d\n", i, c[i].a, i, c[i].b)
    end

end
