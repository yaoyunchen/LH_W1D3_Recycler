require 'pry'
require './variables'
require './methods'
store_open = true
puts :"Hi there, welcome to the store.  What can I do for you today?"

while store_open
  #Gets input from user, and determine course of action.
  puts :"Enter [1] to find initial investment, [2] to find total investment, [3] to exit the store."
  input = gets.chomp
  
  case input
    when '1'
      puts :"How much would you like to spend?"
      calc_initial_investment(get_int)
      
      puts calculation_results
    when '2'
      puts :"How much would you like to spend?"
      calc_investment_with_recursion(get_int)
      
      puts calculation_results
    when '3'
      puts "Thank you, come again!"
      store_open = false
      exit
    else
      puts :"I'm sorry, please select select 1 to buy pop or 2 to exit."
  end
end