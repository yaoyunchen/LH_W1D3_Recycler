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


def calc_initial_investment(money)
  reset
  @buyable = money / 2
  @tradeable_bot = @buyable / 2
  @tradeable_cap = @buyable / 4
  @remain_bot = @buyable % 2
  @remain_cap = @buyable % 4
  @total = @buyable + @tradeable_bot + @tradeable_cap
end

#Resets variables.
def reset
  @tradeable_cap = 0
  @tradeable_bot = 0
  @total = 0
  @tradeable = 0
  @remain_bot = 0
  @remain_cap = 0
end


#Calculate using recursion.
def calc_investment_with_recursion(money)
  reset
  @buyable = money / 2
  @remain_bot = @buyable
  @remain_cap = @buyable
  
  recursion(@buyable) if @buyable >= 1

  @total = @buyable + @tradeable_bot + @tradeable_cap
end

def recursion(full_bottles)
  @tradeable = 0

  recursion_bot(full_bottles)
  recursion_cap(full_bottles)

  @remain_bot += @tradeable
  @remain_cap += @tradeable

  recursion(@tradeable) if @tradeable > 0
end

def recursion_bot(full_bottles)
  if full_bottles >= 2
    @tradeable_bot += 1
    @remain_bot -= 2
    @tradeable += 1
    recursion_bot(@remain_bot)
  end
end

def recursion_cap(full_bottles)
  if full_bottles >= 4
    @tradeable_cap += 1
    @remain_cap -= 4
    @tradeable +=1
    recursion_cap(@remain_cap)
  end
end

def calculation_results
  str = ""
  str << "Buyable: #{@buyable} bottle(s). "
  str << "\nTradable: #{@tradeable_bot} from empty bottles, #{@tradeable_cap} from caps."
  str << "\nTotal: #{@total} bottle(s)."
  str << "\nRemaining: #{@remain_bot} bottles, #{@remain_cap} caps."
end





