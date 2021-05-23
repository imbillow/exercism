function binarysearch(array, x; by=identity, lt=<, rev=false)
    function binarysearch_(array, x, l, r)
        if l > r
            l:r
        else
            let m = (l + r) ÷ 2
                if x == array[m]
                    if l != r && m >= 2 && array[m - 1] == x
                        binarysearch_(array, x, l, m - 1)
                    else
                        m:m
                    end
                elseif lt(x, array[m])
                  binarysearch_(array, x, l, m - 1)
                else
                  binarysearch_(array, x, m + 1, r)
                end
            end
        end
    end

    if rev
        binarysearch_(map(by, array) | reverse, by(x), 1, length(array))
    else
        binarysearch_(map(by, array), by(x), 1, length(array))
    end
end