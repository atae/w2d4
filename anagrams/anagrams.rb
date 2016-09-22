def first_anagram?(first, second)
  find_anagrams(first).include?(second)
end

def find_anagrams(str)
  str_arr = str.split('').permutation.to_a
  str_arr.map { |letters| letters.join('') }
end

def second_anagram?(first, second)
  first.chars.each do |letter|
    if second.include?(letter)
      first.delete!(letter)
      second.delete!(letter)
    end
  end
  first == "" && second == ""
end

def third_anagram?(first, second)
  a = first.chars.sort!.join
  b = second.chars.sort!.join

  a.eql?(b)
end

def fourth_anagram?(first, second)
  hash = Hash.new(0)
  first.chars do |letter|
    hash[letter] += 1
  end
  hash2 = Hash.new(0)
  second.chars do |letter|
    hash2[letter] += 1
  end
  hash.eql?(hash2)
end

def bonus_anagram?(first, second)
  hash = Hash.new(0)
  first.chars do |letter|
    hash[letter] += 1
  end

  second.chars do |letter|
    return false if second.count(letter) != hash[letter]
  end
  true
end
