def array_x2(arr)
  
    if arr.empty?
    puts "Массив пустой"
    return
    end
    
    
    filtered_arr = arr.select { |elem| elem.is_a?(Integer) }
    
    
    if filtered_arr.empty?
    puts "Массив не содержит целочисленные элементы."
    return
    end
    
    
    result_arr = filtered_arr.map { |elem| elem * 2 }
    
   
    result_arr
    end
    
    
    empty_array = []
    puts array_x2(empty_array) 
    
    mixed_array = [1, "two", 3.5, 4, "five"]
    puts array_x2(mixed_array) 
    
    non_integer_array = [1.5, 2.7, 3.2]
    puts array_x2(non_integer_array) 
    
    integer_array = [1, 2, 3, 4, 5]
    puts array_x2(integer_array) 