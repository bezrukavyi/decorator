class AddPrefix < Decorator
  def call(origin, *args, &block)
    after = dec_args.join(' ') + ' '
    before = ' ' + dec_block.call
    after + origin.call.to_s + before
  end
end
