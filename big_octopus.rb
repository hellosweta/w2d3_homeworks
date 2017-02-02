
FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus
#O(n^2)
  longest_idx = 0
  i = 0
  while i < FISH.length
    j = i
    while j < FISH.length
      if FISH[i].length > FISH[j].length
        if i > longest_idx
          longest_idx = i
        end
      else
        if j > longest_idx
          longest_idx = j
        end
      end
      j += 1
    end

    i += 1
  end
  FISH[longest_idx]
end

def dominant_octopus
  #O(nlogn)
  merge_sort(FISH) {|x,y| x.length <=> y.length }[-1]

end

def merge_sort(array, &prc)
  prc ||= Proc.new { |x, y| x <=> y }
  return array if array.length <= 1
  mid_idx = array.length / 2
  sorted_left = merge_sort(array.take(mid_idx), &prc)
  sorted_right = merge_sort(array.drop(mid_idx), &prc)
  merge(sorted_left, sorted_right, &prc)

end

# def merge_sort(array, &prc)
#   return array if array.length <= 1
#
#   mid_idx = array.length / 2
#   merge(
#     merge_sort(array.take(mid_idx), &prc),
#     merge_sort(array.drop(mid_idx), &prc),
#     &prc
#   )
# end

# NB: In Ruby, shift is an O(1) operation. This is not true of all languages.
def merge(left, right, &prc)
  merged_array = []
  prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      merged_array << left.shift
    when 0
      merged_array << left.shift
    when 1
      merged_array << right.shift
    end
  end

  merged_array + left + right
end

def clever_octopus
  #O(n)
  longest = ""
  FISH.each do |fish|
    longest = fish if fish.length > longest.length
  end
  longest
end


def slow_dance(direction, tiles_array)
  #O(n)
  index = 0
  tiles_array.each_with_index {|dir, idx| index = idx if dir == direction}
  index
end

def fast_dance(direction, tiles_hash)
  #O(1)
  tiles_hash[direction]

end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" =>7}

p sluggish_octopus
p dominant_octopus
p clever_octopus
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)
p fast_dance("up", tiles_hash)

p fast_dance("right-down", tiles_hash)
