class Decorator
  class << self
    @@decorators = []

    def all
      @@decorators
    end

    def current
      @@decorators.shift
    end

    def clear
      @@decorators = []
    end
  end

  attr_reader :dec_args, :dec_block

  def initialize(*args, &block)
    @dec_args = args
    @dec_block = block
    @@decorators.unshift(self)
  end
end

module Decoratorium
  def method_added(name)
    super
    decorator = Decorator.current
    if decorator == nil
      Decorator.clear
      return
    end
    origin = instance_method(name)
    define_method(name) do |*args, &block|
      origin = origin.bind(self)
      decorator.call(origin, *args, &block)
    end
  end
end

Dir["dec_methods/*.rb"].each {|file| require_relative file }
