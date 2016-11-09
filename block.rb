class Array
  def my_each
    i=0
    if block_given?
      while i < self.size
        yield(self[i])
        i += 1
      end
    end 

  end
end

proc = Proc.new { |n| puts "#{n} !!"}
[1,2,3].my_each(&proc)