#Makes sure the user enters a numerical entry.
def get_int
  is_int = false
  begin
    while is_int == false
      num = Integer(gets.chomp)
      is_int = true
    end
  rescue ArgumentError
    puts :"Invalid entry.  Please enter a number."
    retry
  end 
  return num
end


#Resets variables, used at beginning of every calculation.
def reset
  @tradeable_cap = 0
  @tradeable_bot = 0
  @total = 0
  @tradeable = 0
  @remain_bot = 0
  @remain_cap = 0
end


def calc_initial_investment(money)
  #Resets the variables for a new calculation.
  reset
  #Calculate amount buyable from money given.
  @buyable = money / 2
  #Calculate how many bottles can be traded from the bought amount.
  @tradeable_bot = @buyable / 2
  @tradeable_cap = @buyable / 4
  #Calculate how many remaining bottles and caps will be left.
  @remain_bot = @buyable % 2
  @remain_cap = @buyable % 4
  #Find the total amount that can be bought & traded initially.
  @total = @buyable + @tradeable_bot + @tradeable_cap
end


#Calculate using recursion.
def calc_investment_with_recursion(money)
  #Resets variables for new calculation.
  reset
  #Calculate hoy many bottles can be bought from money invested.
  @buyable = money / 2
  
  #Determine total empty bottles and caps available for trade.
  @remain_bot = @buyable
  @remain_cap = @buyable
  
  #Calculate total trade amount through recursion.
  recursion if @buyable >= 1

  #Add up the total bottles that can be bought and traded.
  @total = @buyable + @tradeable_bot + @tradeable_cap
end


#Determines how many bottles can be traded.
def recursion
  #Used to determine how many bottles are tradeable each permutation.
  @tradeable = 0

  #Determine how many bottles traded from empty bottles.
  recursion_bot(@remain_bot)
  #Determine how many bottles traded from caps.
  recursion_cap(@remain_cap)

  #The new traded bottles will create more empty bottles and caps, add that to the remaining amounts.
  @remain_bot += @tradeable
  @remain_cap += @tradeable

  #Calculate if bottles were tradeable.
  recursion if @tradeable > 0
end


#Calculates how many bottles can be traded from empty bottles.
def recursion_bot(empty_bottles)
  #Trade until there is less than 2 bottles remaining.
  if empty_bottles >= 2
    @remain_bot -= 2
    @tradeable_bot += 1
    @tradeable += 1
    recursion_bot(@remain_bot)
  end
end


#Calculates how many bottles can be traded from caps.
def recursion_cap(bottle_caps)
  #Trade until there is less than 4 caps remaining.
  if bottle_caps >= 4
    @remain_cap -= 4
    @tradeable_cap += 1
    @tradeable +=1
    recursion_cap(@remain_cap)
  end
end


#Returns a string of the results.
def calculation_results
  str = ""
  str << "Buyable: #{@buyable} bottle(s). "
  str << "\nTradable: #{@tradeable_bot} from empty bottles, #{@tradeable_cap} from caps."
  str << "\nTotal: #{@total} bottle(s)."
  str << "\nRemaining: #{@remain_bot} bottles, #{@remain_cap} caps."
end





