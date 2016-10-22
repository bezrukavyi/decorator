Decoratorium
============

Using
-----

class Test
  extend Decoratorium

  AddPrefix.new('BEFORE') { 'AFTER' }
  Dublicate
  def hello
    'hello'
  end

  Dublicate.new(4)
  def bie
    'bie'
  end
end

p Test.new.hello # "BEFORE hello AFTER"
p Test.new.bie # "bie bie bie bie"


Create own decorator
--------------------

class Dublicate < Decorator
  def call(origin, \*args, &block)
    ......
    origin.call
    ......
  end
end
