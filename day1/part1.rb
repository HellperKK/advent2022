reindeers = File.open('entry.txt', 'r') {|file| file.read}.split("\n\n")
max = reindeers.map do |reindeer|
    reindeer.split("\n").reduce(0) {|memo, line| memo + line.to_i}
end.max

puts max