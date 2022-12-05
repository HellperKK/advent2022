def range_include_range?(range_one, range_two)
    range_one.include?(range_two.first) && range_one.include?(range_two.last)
end

def assignment_to_range(assignment)
    pairs = assignment.split("-")
    (pairs[0].to_i)..(pairs[1].to_i)
end

def has_inclusion?(assignments)
    pairs = assignments.split(",")
    first_assignment = assignment_to_range(pairs[0])
    second_assignment = assignment_to_range(pairs[1])
    range_include_range?(first_assignment, second_assignment) || range_include_range?( second_assignment, first_assignment)
end

assignments = File.open('entry.txt', 'r') {|file| file.read}.split("\n").map(&:strip)

score = 0

assignments.each do |assignment|
    score += 1 if has_inclusion?(assignment)
end

puts score