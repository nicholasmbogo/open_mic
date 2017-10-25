require 'csv'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'


class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_joke_exists
    user = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    assert_instance_of Joke, joke
  end

  def test_sal_has_empty_jokes
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    assert_equal [], sal.jokes
    #assert_instance_of Joke, ali.jokes
  end

  def test_sal_can_learn_to_tell_jokes
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.learn(joke)

    assert_instance_of Array, sal.jokes
    assert_equal [joke], sal.jokes
    #assert_instance_of Joke, sal.jokes
  end

  def test_sal_tells_ali_a_joke_he_learned
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.tell(ali, joke)

    assert_instance_of Array, ali.jokes
    assert_equal [joke], ali.jokes
    assert_equal 1, ali.jokes.count
  end

  def test_new_users_Ilana_and_Josh
    josh = User.new("Josh")
    ilana = User.new("Ilana")

    assert_equal "Josh", josh.name
    assert_equal "Ilana", ilana.name
  end

  def test_josh_learns_jokes_and_performs_for_ilana_and_she_learns_jokes
    josh = User.new("Josh")
    ilana = User.new("Ilana")

    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    josh.learn(joke_1)
    josh.learn(joke_2)

    assert_instance_of Array, ilana.jokes

    josh.perform_routine(ilana)

    assert_equal [joke_1, joke_2], ilana.jokes
    assert_equal 2, ilana.jokes.count
  end

  def test_casey_exists
    casey = User.new("Casey")

    assert_equal "Casey", casey.name
  end

  def test_casey_has_learn_routine
    skip
    casey = User.new("Casey")
    casey.learn_routine('./jokes.csv')

    assert_equal 100, casey.jokes.count
  end
end
