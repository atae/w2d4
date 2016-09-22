def my_min_1(arr)
  arr.each do |check_val|
    smallest = true
    arr.each do |comp_val|
      smallest = false if check_val > comp_val
    end
    return check_val if smallest
  end
end

def my_min_2(arr)
  smallest = arr.first
  arr.each do |check_val|
    smallest = check_val if check_val < smallest
  end
  smallest
end

def largest_contig_subsum1(arr)
  subarrs = sub_arrs(arr)
  sums = []
  subarrs.each do |sub_arr|
    sums << sub_arr.reduce(:+)
  end
  sums.max
end

def sub_arrs(arr)
  sub_arr = []
  arr.each_index do |idx1|
    arr[idx1..-1].each_index do |idx2|
      sub_arr << arr[idx1..(idx2+idx1)]
    end
  end
  sub_arr.reject { |arr| arr.empty? }
end

def better_contig_sum(arr)
  max = 0
  current_sum = 0
  arr.each do |el|
    current_sum += el
    max = current_sum if current_sum > max
    current_sum = 0 if current_sum < 0
  end
  max
end
