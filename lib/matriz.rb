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
  
  def +(other)
    if (self.fil == other.fil) and (self.col == other.col)
      nueva = Matriz.new(self.fil,self.col)
      for i in (0...self.fil)
	for j in (0...self.col)
	  nueva.mat[i][j] = self.mat[i][j] + other.mat[i][j]
	end
      end
      nueva
    else
      puts "Error. No se pueden sumar matrices de distintas dimensiones."
    end
  end

  def -(other)
    if (self.fil == other.fil) and (self.col == other.col)
      nueva = Matriz.new(self.fil,self.col)
      for i in (0...self.fil)
	for j in (0...self.col)
	  nueva.mat[i][j] = self.mat[i][j] - other.mat[i][j]
	end
      end
      nueva
    else
      puts "Error. No se pueden restar matrices de distintas dimensiones."
    end
  end


  def *(other) #multiplicacion: segun other -> x escalar o x otra matriz
    nueva = Matriz.new(self.fil,self.col)
    if other.is_a?(Numeric)
      for i in (0...self.fil)
       for j in (0...self.col)
 	nueva.mat[i][j] = other*self.mat[i][j]
       end
     end
     nueva
    elsif other.is_a?(Matriz)
      if (self.col == other.fil)
	for i in (0...self.fil)
	  for j in (0...other.col)
	    nueva.mat[i][j] = 0
	    for k in (0...self.col)
	      nueva.mat[i][j] += self.mat[i][k]*other.mat[k][j]
	    end
	  end
	end
	nueva
      else
	puts "Error. No se pueden multiplicar estas matrices. La col de la M1 debe coincidir con la fil de M2"
      end
    end
  end
  
  def det #calcula el determinante de una matriz
    if (self.fil == self.col) #la matriz es cuadrada luego podemos calcular el determinante
      if (self.fil == 1) #tiene dimension 1x1
	aux = self.mat[0][0]
      else
	if (self.fil == 2)
	  aux = self.mat[0][0]*self.mat[1][1] - self.mat[0][1]*self.mat[1][0]
	else    
	  aux1, aux2 = 0,0
	  for i in (0...self.fil)
	    p1, p2 = 1,1
	    for j in (0...self.col)
	      columna = i+j
	      if (columna >= self.col)
		columna -= self.col
	      end
	      p1 *= self.mat[j][columna]
	      p2 *= self.mat[self.col-(j+1)][columna]
	    end
	    aux1 += p1
	    aux2 += p2
	  end #end for i
	  total= aux1-aux2
	end #end else
      end #end else
    else
      puts "Error. Esta matriz no es cuadrada, no se puede calcular su determinante"
    end
  end
  
  def ==(other)
    raise unless other.is_a?(Matriz)
    if (self.fil == other.fil) and (self.col == other.col)
      for i in (0...other.fil)
	for j in (0...other.col)
	  if self.mat[i][j] != other.mat[i][j]
	    return false
	  end
	end
      end
      true
    end #if
  end
  
  
end