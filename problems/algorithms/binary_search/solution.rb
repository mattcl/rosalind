# Problem: Binary Search

dataset = File.readlines('dataset.txt')
n = dataset.shift.chomp.to_i
m = dataset.shift.chomp.to_i
haystack = dataset.shift.chomp.split.collect(&:to_i)
needles = dataset.shift.chomp.split.collect(&:to_i)

def binary_search(needle, haystack, lower_bound = 0, upper_bound = nil)
  upper_bound = haystack.size - 1 if upper_bound.nil?

  return -1 if lower_bound > upper_bound

  index = (upper_bound - lower_bound) / 2 + lower_bound
  val = haystack[index]

  return index + 1 if val == needle

  if val > needle
    binary_search(needle, haystack, lower_bound, index - 1)
  else
    binary_search(needle, haystack, index + 1, upper_bound)
  end
end

puts needles.collect { |needle| binary_search(needle, haystack) }.join(' ')
