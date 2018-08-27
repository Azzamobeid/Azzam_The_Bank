require_relative 'bank_classes'

@customers = []
@accounts = []

def welcome_screen
  @current_customer = ""
  puts "Welcome to Azzam's Bank"
  puts "Please choose for Menu"
  puts "_-_-_-_-_-_-_-_-_-_-_-_"
  puts "1. Customer sign-in"
  puts "2. New customer registration "
  choice = gets.chomp.to_i
  case choice
  when 1 then sign_in #method 1
  when 2 then sign_up("","")#method 2
  end
end
#method 1
 def sign_in
   print "Please enter you name"
   name = gets.chomp
   print "Please enter you location"
   location = gets.chomp
   if @customers.empty?
     puts "no customer found with that information"
     sign_up(name, location)
   end
   customer_exists = false
   @customers.each do |customer| #represents each item in the array
     if name == customer.name && location == customer.location
         @current_customer = customer
         customer_exists = true
     end
    end
    if customer_exists
        account_menu
    else
        puts "Does not exsit"
        puts "1. try again?"
        puts "2. sign Up"
        choice = gets.chomp.to_i
        case choice
        when 1 then sign_in #recurrsive method calls itself
        when 2 then sign_up(name, location)
        end
      end
    end
    def sign_up(name, location)#method 2
        if name == "" && location == ""
          print "what is your name?"
          name = gets.chomp
          print " what is your location?"
          location = gets.chomp
        end
        @current_customer = Customer.new(name, location)
        @customers.push(@current_customer)
        puts "Thank you for registration"
        account_menu
      end
      def account_menu
        puts "Account Menu"
        puts "_-_-_-_-_-_-_"
        puts "1. Create an Account"
        puts "2. View Account"
        puts "3. Sign Out"
        choice = gets.chomp.to_i
        case choice
        when 1 then creat_account
        when 2 then view_account
        when 3
           puts "Thank you"
           welcome_screen
         else
           puts "Invalid selection."
           account_menu
        end
      end
      def creat_account
        print "How much will your first deposite be? $"
        amount = gets.chomp.to_i
        print "What type of account will you be opening? "
        acct_type = gets.chomp
        new_acct = Account.new(@current_customer, amount, (@accounts.length+1), acct_type)
        @accounts.push(new_acct)
        puts "Account successfully created!"
        account_menu
      end
      def view_account
        @current_customer = ""
        print "Which account (type) do you want to view?"
        type = gets.chomp
        account_exists = false
        @accounts.each do |account|
          if @current_customer == account.customer && type == account.acct_type.downcase
            @current_customer = accounts
            account_exists = true
          end
        end
        if account_exists
          current_account_actoins
        else
          puts "Try again."
          view_account
        end
      end
      def current_account_actoins
        puts "choose from the following:"
        puts "_-_-_-_-_-_-_-_-_-_-_-_-_-_"
        puts "1. Balacce check"
        puts "2. Make a deposite"
        puts "3. Make a withdrawal"
        puts "4. Return to Account Menu"
        puts " 5. Sign out"
        choice = gets.chomp.to_i
        case choice
        when 1
          puts "current balance is $#{'%0.2'%(@current_account.balance)}"
          current_account_actoins
        when 2
          @current_account.deposite
          current_account_actoins
        when 3
          @current_account.withdrawal
          current_account_actoins
        when 4 then view_account
        when 5 then welcome_screen
        else
          puts "Invalid Selection."
          current_account_actoins

        end

      end

welcome_screen
