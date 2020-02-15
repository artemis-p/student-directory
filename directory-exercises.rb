def input_students
  puts "Please enter the names of the students,cohort, height, country of origin and their hobby"
  puts "To finish, just hit return five times"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  puts "Is #{name} correct? Y/N"
  user_input = gets.chomp
  if user_input == "N"
    "Type again"
    name = gets.chomp
  end
  cohort = gets.chomp
  puts "Is #{cohort} correct? Y/N"
  user_input = gets.chomp
  if user_input == "N"
    "Type again"
    cohort = gets.chomp
  end
  height = gets.chomp
  puts "Is #{height} correct? Y/N"
  user_input = gets.chomp
  if user_input == "N"
    "Type again"
    height = gets.chomp
  end
  country = gets.chomp
  puts "Is #{country} correct? Y/N"
  user_input = gets.chomp
  if user_input == "N"
    "Type again"
    country = gets.chomp
  end
  hobbies = gets.chomp
  puts "Is #{hobbies} correct? Y/N"
  user_input = gets.chomp
  if user_input == "N"
    "Type again"
    hobbies = gets.chomp
  end
  #while the name is not empty repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort, height: height, country: country, hobbies: hobbies}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    puts "Is #{name} correct? Y/N"
    user_input = gets.chomp
    if user_input == "N"
      "Type again"
      name = gets.chomp
    end
    cohort = gets.chomp
    puts "Is #{cohort} correct? Y/N"
    user_input = gets.chomp
    if user_input == "N"
      "Type again"
      cohort = gets.chomp
    end
    height = gets.chomp
    puts "Is #{height} correct? Y/N"
    user_input = gets.chomp
    if user_input == "N"
      "Type again"
      height = gets.chomp
    end
    country = gets.chomp
    puts "Is #{country} correct? Y/N"
    user_input = gets.chomp
    if user_input == "N"
      "Type again"
      country = gets.chomp
    end
    hobbies = gets.chomp
    puts "Is #{hobbies} correct? Y/N"
    user_input = gets.chomp
    if user_input == "N"
      "Type again"
      hobbies = gets.chomp
    end
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
    if student[:name].empty?
      student[:name] = "N/A".to_sym
    elsif student[:cohort].empty?
      student[:cohort] = "N/A".to_sym
    elsif student[:height].empty?
      student[:height] = "N/A".to_sym
    elsif student[:country].empty?
      student[:country] = "N/A".to_sym
    elsif student[:hobbies].empty?
      student[:hobbies] = "N/A".to_sym
    end
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