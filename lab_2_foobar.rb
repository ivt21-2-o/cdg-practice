def greeting
print "Введи своё имя: "
 name = gets
print "Введи свою фамилию: "
 surname = gets
print "Введи свой возраст: "
 age = gets


if (age.to_i < 18)
    puts "Привет, #{name} #{surname}. Тебе меньше 18 лет."
    else
        puts "Привет, #{name} #{surname}. Тебе больше 18 лет."
    end
     
end

greeting()