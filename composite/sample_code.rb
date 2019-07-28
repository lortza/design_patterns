# Our two base classes
class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def time_required
    0.0
  end
end

class CompositeTask < Task
  def initialize(name)
    super(name)
    @subtasks = []
  end

  def add_subtask(task)
    @subtasks << task
  end

  def remove_subtask(task)
    @subtasks.delete(task)
  end

  def time_required
    time = 0.0
    @subtasks.each {|task| time += task.time_required}
    time
  end
end


# Leaf Components (inherit from Task)
class AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingredients to bowl')
  end

  def time_required
    5.0
  end
end

class MixBatterTask < Task
  def initialize
    super('Mix the batter')
  end

  def time_required
    5.0
  end
end

class BakeTask < Task
  def initialize
    super('Bake the cake')
  end

  def time_required
    45.0
  end
end

class CoolTask < Task
  def initialize
    super('Cool the cake')
  end

  def time_required
    60.0
  end
end

class FrostTask < Task
  def initialize
    super('Frost the cake')
  end

  def time_required
    20.0
  end
end


# Composite Component (inherit from CompositeTask)
class MakeBatterTask < CompositeTask
  def initialize
    super('Make the batter')
    @subtasks = []

    add_subtask(AddDryIngredientsTask.new)
    add_subtask(MixBatterTask.new)
  end
end

class MakeCakeTask < CompositeTask
  def initialize
    super("Let's make a cake!")
    @subtasks = []

    add_subtask(MakeBatterTask.new)
    add_subtask(BakeTask.new)
    add_subtask(CoolTask.new)
    add_subtask(FrostTask.new)
  end
end

batter = MakeBatterTask.new
p batter.time_required #=> 10.0

cake = MakeCakeTask.new
p cake.time_required #=> 135.0
