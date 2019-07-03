# Extract observer notification methods into a module
module Notifier
  def add_observer(observer)
    @observers << observer
  end

  def bulk_add_observers(observers)
    @observers << observers
    @observers.flatten!
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self) #self == employee
    end
  end
end



class Employee
  # include Notifier methods in classes that need observers
  include Notifier

  attr_reader :name, :salary

  def initialize(name:, salary:)
    @name = name
    @salary = salary
    @observers = []
  end

  # Overwrite the salary setter method to include a call to the observers
  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

class Payroll
  def update(employee)
    puts "Updates #{employee.name}'s paycheck to adjust for a salary of #{employee.salary}."
  end
end

class CultureTeam
  def update(employee)
    puts "Congratulations to #{employee.name} for their promotion!"
  end
end

class TaxMan
  def update(employee)
    puts "Send #{employee.name} an updated tax bill."
  end
end

payroll = Payroll.new
tax = TaxMan.new
culture_team = CultureTeam.new
zorro = Employee.new(name: 'Zorro', salary: 1000)

zorro.add_observer(payroll)
zorro.add_observer(culture_team)
zorro.add_observer(tax)
zorro.salary = 2000


class Property
  include Notifier

  attr_reader :street_address, :price, :sale_status

  def initialize(street_address:, price:, sale_status:)
    @street_address = street_address
    @price = price
    @sale_status = sale_status
    @observers = []
  end

  def sale_status=(new_status)
    @sale_status = new_status
    notify_observers
  end
end

class Realtor
  def update(property)
    puts "Oh snap! The property at #{property.street_address} is now #{property.sale_status}."
  end
end

class Subscriber
  def update(property)
    puts "The listing you're following at #{property.street_address} is now #{property.sale_status}."
  end
end

class TaxEntity
  def update(property)
    puts "Send a sales tax bill to #{property.street_address} on a value of #{property.price}."
  end
end

class Bank
  def update(property)
    puts "Start racking up interest on #{property.price} for #{property.street_address}."
  end
end

property = Property.new(street_address: '123 Main Street', price: '300,000', sale_status: 'coming soon' )

realtor = Realtor.new
subscriber = Subscriber.new
tax_entity = TaxEntity.new
bank = Bank.new

property.add_observer(realtor)

property.bulk_add_observers([realtor, subscriber, tax_entity, bank])
property.sale_status = 'sold'
