def get_win_score(action)
    enemy = action[0].ord - 65
    player = action[2].ord - 65 - 23
    result = (player - enemy) % 3

    case result
    when 0 then 3
    when 1 then 6
    when 2 then 0
    end
end

def get_action_score(action)
    action[2].ord - 65 - 22
end

actions = File.open('entry.txt', 'r') {|file| file.read}.split("\n")

score = 0

actions.each do |action|
    score += get_win_score(action)
    score += get_action_score(action)
end

puts score