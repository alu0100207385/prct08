require "./lib/matriz.rb"
require "./lib/racional.rb"

describe Matriz do
  
  before :each do
    @m1 = Matriz.new(2,2)
    @m1.llenar([[1,2],[2,3]])
    @m2 = Matriz.new(2,2)
    @m2.llenar([[-1,1],[2,-5]])
    @m4 = Matriz.new(2,2)
    @m4.llenar([[NumerosRacionales.new(1, 1),NumerosRacionales.new(1, 1)],[NumerosRacionales.new(1, 1),NumerosRacionales.new(1, 1)]])
    @m5 = Matriz.new(2,2)
    @m5.llenar([[NumerosRacionales.new(1, 2),NumerosRacionales.new(3, 5)],[NumerosRacionales.new(11, 40),NumerosRacionales.new(49, 150)]])

  end
  
  describe "# Definicion de argumentos: " do
    it " - Las dimensiones son correctas" do
      lambda {@m3.new(-1,1).should raise_error(TypeError)}
      lambda {@m3.new(1,-1).should raise_error(TypeError)}
      @m1.fil.should eq(2)
      @m1.col.should eq(2)
    end
     it "- Contenido de la matriz" do
       @m3 = Matriz.new(2,2)
	@m3.llenar([[1,2],[2,3]])
	aux = true
	i=0
	while (i < @m1.fil) and (aux==true)
	  j=0
	  while (j < @m1.col) and (aux==true)
	    if (@m1.mat[i][j]!=@m3.mat[i][j])
	      aux = false
	    end
	    j+=1
	  end
	  i +=1
	end
	aux.should eq(true)
#	 Se puede hacer de la forma expuesta arriba o de la siguiente forma:
#        (@m1==@m3.llenar([[1,2],[2,3]])).should eq(true)
     end
  end 
  
  describe "# Operaciones de matrices: "do
    it "- Se pueden sumar matrices de enteros" do
      @m3 = Matriz.new(2,2)
      @m3.llenar([[0,3],[4,-2]])
      (@m1+@m2).should == @m3
    end
    it "- Se pueden sumar matrices de numeros racionales" do
      @m3 = Matriz.new(2,2)
      @m6 = Matriz.new(2,2)
      @m3.llenar([[NumerosRacionales.new(1, 2),NumerosRacionales.new(1, 3)],[NumerosRacionales.new(1, 4),NumerosRacionales.new(1, 5)]])
      @m6.llenar([[NumerosRacionales.new(1, 2),NumerosRacionales.new(2, 3)],[NumerosRacionales.new(3, 4),NumerosRacionales.new(4, 5)]])	
      (@m3+@m6).should == @m4
    end
    it "- Se pueden restar matrices de enteros" do
      @m3 = Matriz.new(2,2)
      @m3.llenar([[2,1],[0,8]])
      (@m1-@m2).should == @m3
    end
    it "- Se pueden resta matrices de numeros racionales" do
      @m3 = Matriz.new(2,2)
      @m6 = Matriz.new(2,2)
      @m3.llenar([[NumerosRacionales.new(1, 2),NumerosRacionales.new(1, 3)],[NumerosRacionales.new(1, 4),NumerosRacionales.new(1, 5)]])
      @m6.llenar([[NumerosRacionales.new(1, 2),NumerosRacionales.new(2, 3)],[NumerosRacionales.new(3, 4),NumerosRacionales.new(4, 5)]])	
      (@m3-@m6).should == @m4
    end
    it "- Se multiplica un escalar por una matriz de enteros" do
      @m3 = Matriz.new(2,2)
      @m3.llenar([[2,4],[4,6]])
      (@m1*2).should == @m3
    end
    it "- Se multiplica una matriz de enteros por otra" do
      @m3 = Matriz.new(2,2)
      @m3.llenar([[3,-9],[4,-13]])
      (@m1*@m2).should == @m3
    end
    it "- Se multiplica un escalar por una matriz de racionales" do
      @m3 = Matriz.new(2,2)
      @m6 = Matriz.new(2,2)
      @m3.llenar([[NumerosRacionales.new(1, 2),NumerosRacionales.new(1, 3)],[NumerosRacionales.new(1, 4),NumerosRacionales.new(1, 5)]])
      @m6.llenar([[NumerosRacionales.new(2, 2),NumerosRacionales.new(4, 3)],[NumerosRacionales.new(6, 4),NumerosRacionales.new(8, 5)]])
      @escalar = NumerosRacionales.new(2, 1)
      (@m3*@escalar).should == @m6
    end
    it "- Se multiplican dos matrices racionales" do
      @m3 = Matriz.new(2,2)
      @m6 = Matriz.new(2,2)
      @m3.llenar([[NumerosRacionales.new(1, 2),NumerosRacionales.new(1, 3)],[NumerosRacionales.new(1, 4),NumerosRacionales.new(1, 5)]])
      @m6.llenar([[NumerosRacionales.new(1, 2),NumerosRacionales.new(2, 3)],[NumerosRacionales.new(3, 4),NumerosRacionales.new(4, 5)]])	
      (@m3*@m6).should == @m5
    end
    it "- El metodo determinante"do
      @m1.det==-1
    end
    it "- El metodo determinante para numeros racionales"do
      @m5.det==NumerosRacionales.new(-1, 600)
    end
  end
  
  describe "# Otras operaciones" do
    it "- Traspuesta de una matriz de enteros" do
      (@m2==@m2.t).should eq(false)
    end
    it "- Traspuesta de una matriz de racionales" do
      (@m5==@m5.t).should eq(false)
    end
    it "- Metodo absoluto de una matriz de enteros" do
      @m3 = Matriz.new(2,2)
      @m3.llenar([[1,1],[2,5]])
      @m2.abs==@m3
    end
    it "- Metodo absoluto de una matriz de racionales" do
      @m3 = Matriz.new(2,2)
      @m3.llenar([[NumerosRacionales.new(1, 2),NumerosRacionales.new(1, 3)],[NumerosRacionales.new(1, 4),NumerosRacionales.new(1, 5)]])
      @m3.abs==@m3
    end
    it "- Comparador de igualdad de enteros" do
       (@m1==@m1).should eq(true)
    end
    it "- Comparador de igualdad de racionales" do
       (@m5==@m5).should eq(true)
    end
  end
  
end
