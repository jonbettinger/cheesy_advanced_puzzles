module TraceCalls

    def following(*syms, &block)
      syms.each do |sym|
        hook_method = "__#{sym}__hooked__"
        self.class.send :alias_method, hook_method, sym
        #private hook_method
        self.class.send :define_method, sym do |*args|
          puts "==> Calling #{sym} with #{args.inspect}"
          result = send "__#{sym}__hooked__", *args
          puts "<== result #{result}"
          result
        end
      end
  end

end

class Example
  include TraceCalls

  def some_method(arg1, arg2)
    arg1 + arg2
  end
end

ex = Example.new
ex.following :some_method
puts ex.some_method(4,5)
