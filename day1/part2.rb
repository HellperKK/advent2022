reindeers = File.open('entry.txt', 'r') {|file| file.read}.split("\n\n")
sum_three_greatest = reindeers.map do |reindeer|
    reindeer.split("\n").reduce(0) {|memo, line| memo + line.to_i}
end.sort[-3..-1].sum

puts sum_three_greatest