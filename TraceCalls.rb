module TraceCalls

end

class Example
 include TraceCalls

 def some_method(arg1, arg2)
  arg1 + arg2
 end
end

ex = Example.new
ex.some_method(4,5)

