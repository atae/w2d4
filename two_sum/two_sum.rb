require 'byebug'

def bad_two_sum?(arr, target)
  pairs = []
  arr.each do |el|
    arr.each do |el2|
      pairs << [el, el2] unless el ==el2
    end
  end

  pairs.each do |pair|
    return true if pair.reduce(:+) == target
  end
  false
end

def okay_two_sum?(arr, target)
  return false if arr.size == 1
  arr.sort!
  mid_index = arr.length/2

  mid_sum = arr[mid_index-1] + arr[mid_index]

  if mid_sum == target
    return true
  elsif mid_sum < target
    right_arr = arr[mid_index..-1]
    okay_two_sum?(right_arr,target)
  else
    left_arr = arr[0...mid_index]
    okay_two_sum?(left_arr,target)
  end

  false

end

def pair_sum?(arr, target)
  hash = Hash.new
  arr.each do |el|
    hash[el] = nil
  end
  p hash
  # debugger
  hash.each do |key,_|
    return true if hash.has_key?(target-key) && key != target-key
  end

  false
end
