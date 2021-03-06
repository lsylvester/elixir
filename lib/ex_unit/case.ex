% elixir: cache

module ExUnit::Case
  mixin ExUnit::Assertions

  def __added_as_proto__(base)
    ExUnit::Server.add_case(base.__name__)
    base
  end

  def __tests__
    regexp = ~r(_test$)
    [name for {name, _} in self.__mixin_methods__, regexp.match?(name)]
  end

  def setup(_)
    self
  end

  def teardown(_)
  end
end