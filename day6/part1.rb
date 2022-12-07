message = File.open('entry.txt', 'r') {|file| file.read}

index = 0
regex = /(\w).*\1/

while regex.match?(message[index...(index+4)])
    index += 1
end

puts index + 4