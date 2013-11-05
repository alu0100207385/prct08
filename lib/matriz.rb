class Matriz
  attr_reader :fil, :col, :mat
  
  def initialize (m,n)
    raise TypeError, "Error. Tipo de dimensiones incorrectas" if ((m < 0) or (n < 0))
    @fil, @col = m, n
    @mat = Array.new(@fil) {Array.new(@col)}
#     @mat = Array.new(@fil) {Array.new(@col) {0}}
  end
  
  def to_s
    for i in (0...self.fil)
      print "("
      for j in (0...self.col)
	print " #{self.mat[i][j]}\t"
      end
      puts ")\n"
    end
    puts "\n"
  end

end