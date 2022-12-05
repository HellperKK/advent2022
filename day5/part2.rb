def make_cargo(cargo_lines)
    cargo_lines_split = cargo_lines.split("\n")
    cargo_lines_split.pop

    res = cargo_lines_split.map{|line| make_cargo_line(line)}

    res = Array.new(res[0].length) do |col_index|
        Array.new(res.length) {|line_index| res[line_index][col_index]}.compact
    end
    res
end

def make_cargo_line(cargo_line)
    res = []

    while cargo_line && cargo_line.length > 0
        item = cargo_line[0...3]
        if item == "   "
            res << nil
        else
            res << item[1]
        end

        cargo_line = cargo_line[4..-1]
    end
    res
end

pair = File.open('entry.txt', 'r') {|file| file.read}.split("\n\n")
cargo = make_cargo(pair[0])
orders = pair[1]

regex = /move (\d+) from (\d+) to (\d+)/

orders.split("\n").each do |line|
    capture = regex.match(line)
    quantity = capture[1].to_i
    from = capture[2].to_i
    to = capture[3].to_i
    taken = cargo[from-1].shift(quantity)
    cargo[to-1].unshift(*taken)
end

puts cargo.map(&:first).join