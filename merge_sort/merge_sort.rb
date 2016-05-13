# split array
# start merging step by step
array = [108, 15, 50, 4, 8, 42, 23, 16, 55]

def merge_sort (array)
  # return self if chunk size equals 1
  return array if array.length == 1
  # divide in halves until single elements are reached
  half_1 = array[0, array.length/2]
  half_2 = array[array.length/2..-1]
  # call helper method for sorting slices
  inner_sorter(merge_sort(half_1), merge_sort(half_2))
end


def inner_sorter (part_a, part_b)
  sorted_chunk = []
  i, j = 0, 0
  # compare two slices
  while i < part_a.length && j < part_b.length
    if part_a[i] < part_b[j]
      sorted_chunk << part_a[i]
      i += 1
    else
      sorted_chunk << part_b[j]
      j += 1
    end
  end
  # while loop breaks when one of slices has its all elements transferred - add remaining elements from the other array
  # no need to check which one it is - if the offset passed to #slice is greater than the last index, method returns empty array
  # in this case, concat adds nothing to resulting array; only "unused" elements will be added
  sorted_chunk.concat(part_a[i..-1])
  sorted_chunk.concat(part_b[j..-1])
  return sorted_chunk
end

p merge_sort(array)