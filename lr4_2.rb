def read_students_file(filename)
    students = []
    File.open(filename, "r") do |file|
    file.each_line do |line|
    student_data = line.split
    name = student_data[0]
    surname = student_data[1]
    age = student_data[2].to_i
    students << { name: name, surname: surname, age: age }
    end
    end
    students
    end
    
    def write_students_to_file(students, filename)
    File.open(filename, "w") do |file|
    students.each do |student|
    file.puts "#{student[:name]} #{student[:surname]} #{student[:age]}"
    end
    end
    end
    
    def find_students_by_age(students, age)
    students.select { |student| student[:age] == age }
    end
    
    def read_age_from_user
    puts "Введите возраст (для выхода введите -1):"
    gets.chomp.to_i
    end
    
    def display_students(students)
    puts "Результаты поиска:"
    students.each do |student|
    puts "#{student[:name]} #{student[:surname]} #{student[:age]}"
    end
    end
    
    students_filename = "students.txt"
    results_filename = "results.txt"
    
    # Чтение исходного файла со студентами
    all_students = read_students_file(students_filename)
    puts "Файл со студентами прочитан."
    
    loop do
    age = read_age_from_user
    
    if age == -1
    puts "Программа завершена."
    break
    end
    
    # Поиск студентов по возрасту
    found_students = find_students_by_age(all_students, age)
    
    # Запись найденных студентов в файл результатов
    write_students_to_file(found_students, results_filename)
    puts "Студенты с возрастом #{age} записаны в файл #{results_filename}."
    
    # Вывод найденных студентов на экран
    display_students(found_students)
    end
    
    # Чтение файла результатов и вывод его содержимого
    puts "Содержимое файла #{results_filename}:"
    File.foreach(results_filename) { |line| puts line }
