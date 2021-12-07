input = readlines(joinpath(@__DIR__, "input.txt"));

# PART 1
# counter = 0
# for index in [2:length(input);]
#     if parse(Int64, input[index]) > parse(Int64, input[index-1])
#         global counter += 1
#     end
# end

# PART 2
counter = 0
previousSlide = sum(parse.(Int64, input[1:3]))
for index in [2:length(input) - 2;]
    currentSlide = sum(parse.(Int64, input[index:(index + 2)]))
    if currentSlide > previousSlide ; global counter += 1 ; end
    global previousSlide = currentSlide
end
println(counter)