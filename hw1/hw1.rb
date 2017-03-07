def map_char(c)
  case c
  when "a"
    return 0
  when "b"
    return 1
  when "c"
    return 2
  when "e"
    return 3
  when "f"
    return 4
  else
    return 5
  end
end

def validate(expression)
  edge_table = [
    [0, 0, 0, 0, 0, 0],
    [2, 5, 0, 6, 0, 0],
    [2, 3, 0, 0, 0, 0],
    [0, 5, 4, 0, 0, 0],
    [0, 0, 4, 0, 0, 0],
    [0, 5, 0, 0, 0, 0],
    [0, 0, 0, 0, 7, 0],
    [0, 0, 0, 0, 0, 0]
  ]
  
  state = 1
  
  expression.split("").each do |i|
    state = edge_table[state][map_char(i)]
  end
	
  case state
  when 3, 4, 5, 7
    puts "Accepted"
  else
    puts "Rejected"
  end
end
