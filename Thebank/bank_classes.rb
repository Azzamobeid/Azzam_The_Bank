class Customer
  attr_accessor :name, :location
  def initialize (name, location)
  @name = name
  @location = location
  end
end

class Account
  attr_reader :acct_number, :balance
  attr_accessor :customer, :acct_type
  def initialize (acct_number, balance, customer, acct_type)
    @acct_number = acct_number
    @balance = balance
    @customer = customer
    @acct_type = acct_type
  end
  def deposite
    puts "How much would you like to deposite?"
    print "$"
    amount = gets.chomp.to_f
    @balance += amount
    puts "your new balance is $ #{'%0.2f'%(@balance)}"
  end
  def withdraw
    puts "How much do you want to withdraw?"
    print "$"
    amount = gets.chomp.to_f
    if @balance < amount
       @balance -= (amount + 25)
    else
      @balance -= amount

    end
  #  puts "Your new balance is $#{'%0.2f'%(@balance)} "
  end
end
