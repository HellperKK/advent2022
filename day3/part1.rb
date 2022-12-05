def get_common_item(stock)
    item_length = stock.length / 2
    first_item = stock[0...item_length]
    second_item = stock[item_length..-1]
    (first_item.split("").uniq & second_item.split("").uniq).join("")
end

def get_item_score(item)
    if ("a".."z").include?(item)
        item.ord - 96
    else
        item.ord - 64 + 26
    end
end

stocks = File.open('entry.txt', 'r') {|file| file.read}.split("\n")

score = 0

stocks.each do |stock|
    common_item = get_common_item(stock)
    score += get_item_score(common_item)
end

puts score