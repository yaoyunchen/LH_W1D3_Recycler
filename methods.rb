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


def calculation_results
  str = ""
  str << "Buyable: #{@buyable} bottle(s). "
  str << "\nTradable: #{@tradeable_bot} from empty bottles, #{@tradeable_cap} from caps = #{@trade_amount} bottle(s)."
  str << "\nRemaining: #{@remain_bot} bottles, #{@remain_cap} caps."
end





