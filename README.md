Decoratorium
============

Using
-----
```ruby
class Test
  extend Decoratorium

  AddPrefix.new('BEFORE') { 'AFTER' }
  Dublicate.new
  def hello
    'hello'
  end

  Dublicate.new(4)
  def bie
    'bie'
  end
end

p Test.new.hello # "BEFORE hello hello AFTER"
p Test.new.bie # "bie bie bie bie"
```

Create own decorator
--------------------
```ruby
class Dublicate < Decorator
  def call(origin, \*args, &block)
    ......
    origin.call
    ......
  end
end
```
