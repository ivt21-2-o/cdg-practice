def funcCS(str)
    return nil unless str.is_a? String
    return str.end_with?("CS") ? 2 ** str.length : str.reverse end
    
    fStr = "stringCS"

    puts funcCS(fStr)
    
