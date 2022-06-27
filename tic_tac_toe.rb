game_board_nested = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
game_board = Array.new(3) { Array.new(3, ' ') }
p game_board

puts '┌───┬───┬───┐'
game_board_nested[0].each { |mark| print '│ ' + mark.to_s + ' ' }
puts '│'
puts '├───┼───┼───┤'
game_board_nested[1].each { |mark| print '│ ' + mark.to_s + ' ' }
puts '│'
puts '├───┼───┼───┤'
game_board_nested[2].each { |mark| print '│ ' + mark.to_s + ' ' }
puts '│'
puts '└───┴───┴───┘'
