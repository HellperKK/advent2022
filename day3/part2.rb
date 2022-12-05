def make_groups(stock)
    groups = []

    while stock.length > 0
        groups << stock[0...3]
        stock = stock[3..-1]
    end

    groups
end

def get_common_item(group)
    group.inject do |memo, item|
        (memo.split("").uniq & item.split("").uniq).join("")
    end
end

def get_item_score(item)
    if ("a".."z").include?(item)
        item.ord - 96
    else
        item.ord - 64 + 26
    end
end

stocks = File.open('entry.txt', 'r') {|file| file.read}.split("\n").map(&:strip)
groups = make_groups(stocks)

score = 0

groups.each do |stock|
    common_item = get_common_item(stock)
    score += get_item_score(common_item)
end

puts score
