
def roller va, vl
	solns = []

	csums = []
	nets = []
	min = 0
	sum = 0
	(0..(va.length - 1)).each do |i|
		sum += va[i] - vl[i]
		nets[i] = va[i] - vl[i]
		csums[i] = sum
		if sum < min
			min = sum
		end
	end

	# attempt 1 -> [2,5]
	# csums.each_with_index do |s, index|
	# 	if (min + s) > -1
	# 		solns.push(index)
	# 	end
	# end

	# attempt 2 -> []
	# sum = min
	# nets.each_with_index do |v, i|
	# 	sum += v
	# 	if sum > 0
	# 		solns.push(i)
	# 	end
	# end

	# attempt 3 -> [1,2,4,5]
	# csums.each_with_index do |s, index|
	# 	rev_sum = nets.slice(index, nets.length - 1).reduce(0, :+)
	# 	if (min + rev_sum) > -1
	# 		solns.push(index)
	# 	end
	# end

	# attempt 4 -> [2, 4, 5]
	# if the sum of the cummulative sums from the current index to the end
	# is greater than the minimum value the current sum reaches, then
	# the current index is a solution.
	#
	# in other words, if you start here, the first leg of the journey
	# needs to provide enough net energy to counteract the
	# highest friction/slowest point
	rev_sums = []
	(0..(va.length - 1)).reverse_each do |i|
		revs = csums[i]
		if (i < va.length - 1)
			revs += rev_sums[i + 1]
		end
		rev_sums[i] = revs
	end

	csums.each_with_index do |s, index|
		# rev_sum = csums.slice(index, nets.length - 1).reduce(0, :+)
		if (min + rev_sums[index]) > -1
			solns.push(index)
		end
	end

	solns
end

va1 = [1,3,4,1,7,3]
vl1 = [1,4,2,3,6,2]

va2 = [1,1,1,1]
vl2 = [1,1,2,1]

va3 = [2,1,3,1]
vl3 = [2,2,1,2]

va4 = [0,2,0,0,2]
vl4 = [1,0,1,1,0]


puts roller(va1, vl1).to_s
puts roller(va2, vl2).to_s
puts roller(va3, vl3).to_s
puts roller(va4, vl4).to_s



