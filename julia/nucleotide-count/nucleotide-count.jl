"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    if contains(strand, r"[^ACGT]")
        throw(DomainError(strand))
    else
        Dict(k => count(==(k), strand) for k in "ACGT")
    end
end
