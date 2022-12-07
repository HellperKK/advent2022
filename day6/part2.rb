message = File.open('entry.txt', 'r') {|file| file.read}

index = 0
regex = /(\w).*\1/

while regex.match?(message[index...(index+14)])
    index += 1
end

puts index + 14