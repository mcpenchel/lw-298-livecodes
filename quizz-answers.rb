students = [33, 30, 28, 24, 26, 24, 30, 22, 27, 40, 30, 26]

puts students.sum / students.size

total = 0
students.each do |student_age|
  total += student_age
end

puts total / students.size

students = [["John", 22], ["Bob", 26], ["Cassandra", 32]]

my_new_array = students.map do |student_info|
  {
    name: student_info[0],
    age:  student_info[1]
  }
end

puts my_new_array
