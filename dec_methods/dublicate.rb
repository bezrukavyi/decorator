class Dublicate < Decorator
  def call(origin, *args, &block)
    origin = origin.call.to_s
    res = ''
    num = dec_args[0] || 2
    num.times { res += origin + ' ' }
    res.gsub(/\s+$/, '');
  end
end
