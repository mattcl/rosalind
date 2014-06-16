# Problem: Computing GC Content

dataset = File.readlines('dataset.txt')

data = Hash.new { |h, k| h[k] = '' }

cur = nil
dataset.each do |line|
  res = line.match(/^>(.*)/)
  if res
    cur = res[1]
  elsif cur
    data[cur] += line.strip
  end
end

max = 0
max_key = nil
data.each do |k, v|
  pct = v.gsub(/[AT]/, '').length.to_f / v.length.to_f * 100
  if pct > max
    max = pct
    max_key = k
  end
end

puts max_key
puts max
