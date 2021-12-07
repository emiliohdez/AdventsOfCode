input = readlines(joinpath(@__DIR__, "input.txt"));

# PART 1
# counters = [[0,0] for bit in input[1]]
# for binaryNumber in input #each line
#     for (i, bit) in enumerate(binaryNumber)
#         bit == '0' ? (counters[i][1] += 1) : (counters[i][2] += 1)
#     end
# end
# exponent = length(input[1]) - 1
# values = [0, 0] # [γ,ϵ]
# for counter in counters
#     #Hubo más 1s que 0s
#     counter[1] < counter[2] ? values[1] += 2^(exponent) : values[2] += 2^(exponent)
#     global exponent -= 1;
# end
# values[1] * values[2]

function splitDataset(dataset, bitPosition)
    index = length(dataset[1]) - bitPosition + 1
    println(bitPosition, " / ", index)
    (listForCeros, listForOnes) = ([],[])
    for binaryNumber in dataset
        (binaryNumber[index] == '0') ? push!(listForCeros, binaryNumber) : push!(listForOnes, binaryNumber)
    end
    return (listForCeros, listForOnes)
end

function getOxygenRating(dataset, bitPosition)
    if length(dataset) == 1
        return dataset[1]
    else
        (listForCeros, listForOnes) = splitDataset(dataset, bitPosition)
        if length(listForOnes) > length(listForCeros) || length(listForOnes) == length(listForCeros)
            return getOxygenRating(listForOnes, bitPosition -= 1)
        else
            return getOxygenRating(listForCeros, bitPosition -= 1)
        end
    end
end

function getCO2Rating(dataset, bitPosition)
    if length(dataset) == 1
        return dataset[1]
    else
        (listForCeros, listForOnes) = splitDataset(dataset, bitPosition)
        if length(listForOnes) > length(listForCeros) || length(listForOnes) == length(listForCeros)
            return getCO2Rating(listForCeros, bitPosition -= 1)
        else
            return getCO2Rating(listForOnes, bitPosition -= 1)
        end
    end
end

numberOfBits = length(input[1])
oxygenRating = parse(Int64, getOxygenRating(input, numberOfBits), base=2)
CO2Rating = parse(Int64, getCO2Rating(input, numberOfBits), base=2)
println(oxygenRating * CO2Rating)