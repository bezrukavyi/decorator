class Decorator
  class << self
    def new(*args)
      @@decorator = self
      @@args = args
    end
    def decorator
      @@decorator
    end

    def clear
      @@decorator = nil
    end
  end
end

module AddedDecorator
  def method_added(name)
    super
    decorator = Decorator.decorator
    return unless decorator
    Decorator.clear
    origin_method = instance_method(name)
    # p self #Test
    define_method(name) do |*args, &block|
      # p self #Test obj
      origin_obj_method = origin_method.bind(self)
      decorator.call(origin_obj_method, *args, &block)
    end
  end
end

class AddPrefix < Decorator
  def self.call(origin, *args, &block)
    @@args.join(' ') + "'#{origin.call}'"
  end

end

class Test
  extend AddedDecorator

  AddPrefix.new('I am decorator', 'and i say ')
  def hello
    'hello'
  end

  def bie
    'bie'
  end
end

puts Test.new.hello
