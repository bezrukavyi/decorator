require_relative 'decoratorium'

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
