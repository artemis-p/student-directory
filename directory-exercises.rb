def input_students
  puts "Please enter the names of the students,cohort, height, country of origin and their hobby"
  puts "To finish, just hit return five times"
  #create an empty array
  students = []
  #get the first name
  name = gets.chop
  cohort = gets.chop
  height = gets.chop
  country = gets.chop
  hobbies = gets.chop
  #while the name is not empty repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort, height: height, country: country, hobbies: hobbies}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chop
    cohort = gets.chop
    height = gets.chop
    country = gets.chop
    hobbies = gets.chop
  end
  # return the array of students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  students.each do |student|
    puts "#{student[:name]}, #{student[:cohort]}, #{student[:height]}, #{student[:country]}, #{student[:hobbies]}"
  end
end
def print_footer(students)
  if students.count == 1
      puts "Overall, we have #{students.count} great student"
  else
      puts "Overall, we have #{students.count} great students"
  end
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)