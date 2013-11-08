require "./lib/matriz.rb"

describe Matriz do
  
  before :each do
    @m1 = Matriz.new(2,2)
    @m1.llenar([[1,2],[2,3]])
    @m2 = Matriz.new(2,2)
    @m2.llenar([[-1,1],[2,-5]])
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
#        (@m1==@m3.llenar([[1,2],[2,3]])).should eq(true)
     end
  end 

  describe "# Operaciones de matrices: "do
    it "- Se pueden sumar matrices" do
      @m3 = Matriz.new(2,2)
      @m3.llenar([[0,3],[4,-2]])
      (@m1+@m2).should == @m3
    end
    it "- Se pueden restar matrices" do
      @m3 = Matriz.new(2,2)
      @m3.llenar([[2,1],[0,8]])
      (@m1-@m2).should == @m3
    end
    it "- Se multiplica un escalar por una matriz" do
      @m3 = Matriz.new(2,2)
      @m3.llenar([[2,4],[4,6]])
      (@m1*2).should == @m3
    end
    it "- Se multiplica una matriz por otra" do
      @m3 = Matriz.new(2,2)
      @m3.llenar([[3,-9],[4,-13]])
      (@m1*@m2).should == @m3
    end
    it "- El metodo determinante"do
      @m1.det==-1
    end
  end

  describe "# Otras operaciones" do
    it "- Traspuesta de una matriz" do
      @m1==@m1.t
    end
    it "- Metodo absoluto de una matriz" do
      @m3 = Matriz.new(2,2)
      @m3.llenar([[1,1],[2,5]])
      @m2.abs==@m3
    end
    it "- Comparador de igualdad" do
       (@m1==@m1).should eq(true)
    end
  end
  
end
