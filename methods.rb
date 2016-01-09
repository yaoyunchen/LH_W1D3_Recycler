#Makes sure the user enters a numerical entry.
def get_int
  is_num = false
  begin
    while is_num == false
      num = Integer(gets.chomp)
      is_num = true
    end
  rescue ArgumentError
    puts :"Invalid entry.  Please enter a number."
    retry
  end 
  return num
end


def calc_investment(money)
  @buyable = money / 2
  @tradeable_bot = @buyable / 2
  @tradeable_cap = @buyable / 4
  @remain_bot = @buyable % 2
  @remain_cap = @buyable % 4
  @trade_amount = @tradeable_bot + @tradeable_cap
end

#Resets variables.
def reset
  @tradeable_cap = 0
  @tradeable_bot = 0
  @remain_bot = 0
  @remain_cap = 0
end


#Calculate using recursion.
def calc_investment_with_recursion(money)
  reset
  @buyable = money / 2
  calc_bottles(@buyable)
  calc_caps(@buyable)
  @trade_amount = @tradeable_bot + @tradeable_cap
end


#Determine tradeable bottle amount from empty bottles, and remaining empty bottles.
def calc_bottles(full_bottles)
  #binding.pry
  if full_bottles > 1
    @tradeable_bot += 1
    calc_bottles(full_bottles - 2)
  else
    @remain_bot = full_bottles
  end
end


#Determine tradeable bottle amount from caps, and remaining caps.
def calc_caps(full_bottles)
  if full_bottles >  3
    @tradeable_cap += 1
    calc_caps(full_bottles - 4)
  else
    @remain_cap = full_bottles
  end
end

def calculation_results
  str = ""
  str << "Buyable: #{@buyable} bottle(s). "
  str << "\nTradable: #{@tradeable_bot} from empty bottles, #{@tradeable_cap} from caps = #{@trade_amount} bottle(s)."
  str << "\nRemaining: #{@remain_bot} bottles, #{@remain_cap} caps."
end





