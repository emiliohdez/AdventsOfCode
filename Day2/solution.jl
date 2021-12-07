input = readlines(joinpath(@__DIR__, "input.txt"));
commands = split.(input, " ")

# PART 1
# position = [0, 0]
# for command in commands
#     if command[1] == "forward"
#         position[1] += parse(Int64, command[2])
#     elseif command[1] == "down"
#         position[2] += parse(Int64, command[2])
#     elseif command[1] == "up"
#         position[2] -= parse(Int64, command[2])
#     end
# end
# println(position[1] * position[2])

# PART 2
position = [0, 0]
aim = 0
for command in commands
    X = parse(Int64, command[2])
    if command[1] == "forward"
        position[1] += X
        position[2] += aim * X
    elseif command[1] == "down"
        global aim += X
    elseif command[1] == "up"
        global aim -= X
    end
end
println(position[1] * position[2])