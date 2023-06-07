# Спрашиваем у пользователя, сколько покемонов добавить
puts "Сколько покемонов вы хотите добавить?"
pokemon_count = gets.chomp.to_i

# Создаем пустой массив для хранения покемонов
pokemon_array = []

# Повторяем процесс заполнения массива указанное количество раз
pokemon_count.times do |i|
puts "Введите имя покемона ##{i+1}:"
name = gets.chomp

puts "Введите цвет покемона ##{i+1}:"
color = gets.chomp

# Создаем хеш для текущего покемона и добавляем его в массив
pokemon = { name: name, color: color }
pokemon_array << pokemon
end

# Выводим полученный массив покемонов
puts "Массив покемонов:"
puts pokemon_array
    