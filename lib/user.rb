require 'csv'
class User
  attr_reader :name

  def initialize(name)
    @name = name
    @jokes = []
  end

  def jokes
    @jokes
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(name, joke)
    name.learn(joke)
  end

  def perform_routine(name)
    jokes.each do |joke|
      tell(name, joke)
    end
  end

  def learn_routine(filename)
   CSV.foreach(filename, headers: true) do |line|
     @jokes << line
   end
  end
end
