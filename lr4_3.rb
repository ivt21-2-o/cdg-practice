BALANCE_FILENAME = "balance.txt"
STARTING_BALANCE = 100.0

def read_balance
if File.exist?(BALANCE_FILENAME)
File.read(BALANCE_FILENAME).to_f
else
STARTING_BALANCE
end
end

def write_balance(balance)
File.write(BALANCE_FILENAME, balance.to_s)
end

def prompt_deposit(balance)
puts "Введите сумму для депозита (баланс: #{balance}):"
gets.chomp.to_f
end

def prompt_withdraw(balance)
puts "Введите сумму для снятия (баланс: #{balance}):"
gets.chomp.to_f
end

def perform_deposit(balance, amount)
if amount > 0
balance += amount
puts "Сумма #{amount} успешно добавлена. Новый баланс: #{balance}"
else
puts "Неверная сумма для депозита."
end
balance
end

def perform_withdraw(balance, amount)
if amount > 0 && amount <= balance
balance -= amount
puts "Сумма #{amount} успешно снята. Новый баланс: #{balance}"
else
puts "Неверная сумма для снятия."
end
balance
end

def display_balance(balance)
puts "Текущий баланс: #{balance}"
end

balance = read_balance
puts "Текущий баланс: #{balance}"

loop do
puts "D - Депозит"
puts "W - Снять средства"
puts "B - Проверить баланс"
puts "Q - Выйти"

choice = gets.chomp.downcase

case choice
when "d"
amount = prompt_deposit(balance)
balance = perform_deposit(balance, amount)
when "w"
amount = prompt_withdraw(balance)
balance = perform_withdraw(balance, amount)
when "b"
display_balance(balance)
when "q"
write_balance(balance)
puts "Баланс сохранен."
break
else
puts "Неверная команда"
end
end