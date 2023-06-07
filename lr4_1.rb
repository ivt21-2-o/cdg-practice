class FileHandler
    FILENAME = "data.txt"
    
    def self.index
    file = File.open(FILENAME, "r")
    lines = file.readlines
    file.close
    
    lines.each { |line| puts line }
    end
    
    def self.find(id)
    file = File.open(FILENAME, "r")
    lines = file.readlines
    file.close
    
    line = lines[id.to_i - 1]
    puts line if line
    end
    
    def self.where(pattern)
    file = File.open(FILENAME, "r")
    lines = file.readlines
    file.close
    
    lines.each do |line|
    puts line if line.include?(pattern)
    end
    end
    
    def self.update(id, text)
    file = File.open(FILENAME, "r+")
    lines = file.readlines
    
    if id.to_i <= lines.length
    lines[id.to_i - 1] = text + "\n"
    file.rewind
    file.puts lines
    file.truncate(file.pos)
    puts "Строка с id #{id} обновлена"
    else
    puts "Строка с id #{id} не найдена"
    end
    
    file.close
    end
    
    def self.delete(id)
    file = File.open(FILENAME, "r+")
    lines = file.readlines
    
    if id.to_i <= lines.length
    lines.delete_at(id.to_i - 1)
    file.rewind
    file.puts lines
    file.truncate(file.pos)
    puts "Строка с id #{id} удалена"
    else
    puts "Строка с id #{id} не найдена"
    end
    
    file.close
    end
    end
    
    loop do
    puts "Выберите метод:"
    puts "1. Вывести все строки (index)"
    puts "2. Найти строку по id (find)"
    puts "3. Найти строки по паттерну (where)"
    puts "4. Обновить строку по id (update)"
    puts "5. Удалить строку по id (delete)"
    puts "6. Выход"
    
    choice = gets.chomp.to_i
    
    case choice
    when 1
    FileHandler.index
    when 2
    puts "Введите id строки:"
    id = gets.chomp.to_i
    FileHandler.find(id)
    when 3
    puts "Введите паттерн:"
    pattern = gets.chomp
    FileHandler.where(pattern)
    when 4
    puts "Введите id строки:"
    id = gets.chomp.to_i
    puts "Введите новый текст:"
    text = gets.chomp
    FileHandler.update(id, text)
    when 5
    puts "Введите id строки:"
    id = gets.chomp.to_i
    FileHandler.delete(id)
    when 6
    break
    else
    puts "Некорректный выбор"
    end
    end