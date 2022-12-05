def get_win_score(action)
    result = action[2].ord - 65 - 23

    case result
    when 0 then 0
    when 1 then 3
    when 2 then 6
    end
end

def get_action_score(action)
    enemy = action[0].ord - 65
    result = action[2].ord - 65 - 23

    case result
    when 0 then (enemy + 2) % 3 + 1
    when 1 then enemy + 1
    when 2 then (enemy + 1) % 3 + 1
    end
end

actions = File.open('entry.txt', 'r') {|file| file.read}.split("\n")

score = 0

actions.each do |action|
    score += get_win_score(action)
    score += get_action_score(action)
end

puts score