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
  
end
