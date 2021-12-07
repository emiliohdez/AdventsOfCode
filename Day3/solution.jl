input = readlines(joinpath(@__DIR__, "input.txt"));
counters = [[0,0] for bit in input[1]]
for binaryNumber in input #each line
    for (i, bit) in enumerate(binaryNumber)
        bit == '0' ? (counters[i][1] += 1) : (counters[i][2] += 1)
    end
end
exponent = length(input[1]) - 1
values = [0, 0] # [γ,ϵ]
for counter in counters
    #Hubo más 1s que 0s
    counter[1] < counter[2] ? values[1] += 2^(exponent) : values[2] += 2^(exponent)
    global exponent -= 1;
end
values[1] * values[2]