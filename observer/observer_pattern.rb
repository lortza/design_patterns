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
      observer.update(self)
    end
  end
end


class PullRequest
  include Notifier

  attr_reader :number, :title, :status, :developer
  def initialize(number:, title:, status:, developer:)
    @number = number
    @title = title
    @status = status
    @developer = developer
    @observers = []
  end

  def status=(new_status)
    @status = new_status
    notify_observers
  end
end

class FavsiesDeveloper
  attr_reader :name
  def initialize(name:)
    @name = name
  end

  def update(pr)
    output = case pr.status
      when 'approved' then "Hey y'all PR #{pr.number}: '#{pr.title}' is approved. I'm going to deploy it now."
      when 'deployed' then "[pats self on back for deploying PR #{pr.number} and eats celebratory cheese]"
    end
    puts "#{self.name} says: #{output}" if output
  end
end

class DeployBot
  def update(pr)
    output = case pr.status
      when 'merged' then "PR #{pr.number}: '#{pr.title}' is merged and deployment has started."
      when 'deployed' then "PR #{pr.number}: '#{pr.title}' is successfully deployed."
    end
    puts "#{self.class} says: #{output}" if output
  end
end

class JiraBot
  def update(pr)
    output = case pr.status
      when 'approved' then "PR #{pr.number}: '#{pr.title}' is moved to the 'TO DEPLOY' column."
      when 'deployed' then "PR #{pr.number}: '#{pr.title}' is moved to the 'DONE' column."
    end
    puts "#{self.class} says: #{output}" if output
  end
end

class BelovedProductManager
  def update(pr)
    output = case pr.status
      when 'deployed' then "Get off my back higher-ups! The '#{pr.title}' work is done."
    end
    puts "#{self.class} says: #{output}" if output
  end
end

class AdoredManager
  def update(pr)
    output = case pr.status
      when 'deployed' then "High fives to #{pr.developer.name} for PR #{pr.number}! [makes note in file that #{pr.developer.name} rules]."
    end
    puts "#{self.class} says: #{output}" if output
  end
end

# Now let's make it happen!
lisa_brybry = FavsiesDeveloper.new(name: 'Lisa & BryBry')
stonks = AdoredManager.new
evan = BelovedProductManager.new
deploybot = DeployBot.new
jirabot = JiraBot.new

pr = PullRequest.new(number: 1234, title: 'Sweet new feature that will change the world', status: 'open', developer: lisa_brybry)
pr.bulk_add_observers([
  deploybot,
  lisa_brybry,
  evan,
  stonks,
  jirabot,
])

# Uncomment one of these to see the magic
# pr.status = 'approved'
# pr.status = 'merged'
# pr.status = 'deployed'

