class BankAccount
  attr_reader :starting_balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  # Other methods the proxy doesn't need
  def print_stuff
    puts "#{private_method_hello} annnnnd buh-#{private_method_bye}"
  end

  private

  def private_method_hello
    'hello'
  end

  def private_method_bye
    'bye'
  end
end

require 'etc'
class BankAccountProtectionProxy
  attr_reader :starting_balance

  def initialize(account, owner_email)
    @owner_email = owner_email
    @account = account
  end

  def deposit(amount)
    authorized?
    return @account.deposit(amount)
  end

  def withdraw(amount)
    authorized?
    return @account.withdraw(amount)
  end

  private

  def authorized?
    if Etc.getlogin != @owner_email
      raise "Not Authorized: #{Etc.getlogin} cannot access this account."
    end
  end
end


account = BankAccount.new(100)
proxy = BankAccountProtectionProxy.new(account, 'zorro@email.com') # fails
proxy = BankAccountProtectionProxy.new(account, 'mycomputerloginname') #passes
p proxy.deposit(50)
