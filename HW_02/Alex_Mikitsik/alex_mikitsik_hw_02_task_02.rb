# To find out all possible combinations let use
# a lexicographical order (1, 3, 4, 6) and
# find all calculated permutations equal to 24

order = [1.0, 3.0, 4.0, 6.0]

perm_oder = order.permutation.to_a # receive all permutations array

i = 0

flag = 1 # marker to help us

perm_oder.each do
  result = perm_oder[i][0] * perm_oder[i][1] / perm_oder[i][2] + \
           perm_oder[i][3] # allowed types of calculation results
  if result == 24
    puts "Yes, we did find it!\n24 = #{perm_oder[i][0]} * \
    #{perm_oder[i][1]} / #{perm_oder[i][2]} + #{perm_oder[i][3]}"
    flag -= 1
  end
  puts result
  i += 1
end

puts 'Unfortunately the equality not found! :-(' if flag == 1
