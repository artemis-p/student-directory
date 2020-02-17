require 'csv'

@students = [] #an empty array accessible to all methods

def print_menu 
  #1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" #9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    #2. read the input and ave it into a variable
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  #3. do what the user has asked
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
    puts "Students saved successfully!"
  when "4"
    puts "Give filename to load (ignore .csv):"
    input_file = gets.chomp + ".csv"
    load_students(input_file)
    puts "Students loaded successfully!"
  when "9"
    exit #this will cause the program to terminate"
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty repeat this code
  while !name.empty? do
    # add the student hash to the array
    students_append(name, :november)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  #open the file for writing
  puts "Give filename to save (ignore .csv):"
  input_file = gets.chomp+".csv"
  CSV.open(input_file, "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "Filename: " + input_file
end

def load_students(filename)
  CSV.foreach(filename) do |row|
    name = row[0]
    cohort = row[1]
    students_append(name, cohort.to_sym)
  end
end

def students_append(name, cohort)
  @students << {name: name, cohort: cohort}
  
end

def get_filename
    filename = ARGV.first #first argument from the command line
  if filename.nil? # get out of the method if it isn't given
    filename = 'students.csv'
  end
end

def try_load_students
  filename = get_filename
  if File.exists?(filename) #if it exists
    load_students('students.csv')
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

# def print_file
#   File.open($0, "r") do |file|
#     file.readlines.each do |line|
#       puts line
#     end
#   end
# end

# print_file
try_load_students
interactive_menu