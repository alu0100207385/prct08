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

  def generar
    @mat = Array.new(@fil) {Array.new(@col) {rand(-10..10)}}
  end
  
  def llenar (other)
    if other.is_a?(Array)
      for i in (0...self.fil)
	for j in (0...self.col)
	  self.mat[i][j] = other[i][j]
	end
      end
    end
  end
  
  def introducir_datos
    puts "Rellene la matriz..."
    for i in (0...self.fil)
      for j in (0...self.col)
	puts "casilla (#{i},#{j}): "
	STDOUT.flush
	dato=gets.chomp
	self.mat[i][j]=dato.to_i
      end
    end
  end
  
  
end