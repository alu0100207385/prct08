#Funcion menu
require './lib/matriz.rb'

def menu1
  system ("clear")
  z=0
  while (z<1 or z>5)
    op=["\t\tMENU","\t1. Crear matrices","\t2. Generar matrices con valores aleatorios","\t3. Operaciones con matrices","\t4. Mostrar matrices","\t5. Salir"]
    op.each{|op| puts op}
    z=gets.chomp
    z=z.to_i
    if (z<1 or z>5)
      puts ("Escoja una opcion entre [1..5]")
    end
  end
  z
end

def menu2
  system ("clear")
  z=0
  while (z<1 or z>5)
    op=["\t\tOPERACIONES CON MATRICES","\t1. Suma y resta de matrices","\t2. Producto escalar y entre matrices","\t3. Traspuesta y absoluto de una matriz","\t4. Calcular determinante","\t5. Volver"]
    op.each{|op| puts op}
    z=gets.chomp
    z=z.to_i
    if (z<1 or z>5)
      puts ("Escoja una opcion entre [1..5]")
    end
  end
  z
end

def menu3
  z=0
  while (z<1 or z>2)
    op=["\tQuiere trabajar con enteros o fracciones?","\t1. Numeros enteros","\t2. Numeros racionales"]
    op.each{|op| puts op}
    z=gets.chomp
    z=z.to_i
    if (z<1 or z>2)
      puts ("Escoja una opcion entre [1..2]")
    end
  end
  z
end
  
#Esta funcion la utilizamos para pausar del programa
def pausa
#     while line=gets
     while gets
      break
    end
end


#Ejecucion del programa principal
def principal
  op=0
  while (op!=5)
    op= menu1
    case op
      when 1
	puts "CREAR MATRICES"
	puts "Introduce la dimension de las matriz 1: "
	print "Filas? "
	STDOUT.flush
	f=gets.chomp
	print "Columnas? "
	c=gets.chomp
	a = Matriz.new(f.to_i,c.to_i)
# 	puts a.to_s
	puts "Introduce la dimension de las matriz 2: "
	print "Filas? "
	STDOUT.flush
	f=gets.chomp
	print "Columnas? "
	c=gets.chomp
	b = Matriz.new(f.to_i,c.to_i)

	op3=menu3
	case op3
	when 1
	  a.introducir_datos(1)
	  b.introducir_datos(1)
	when 2
	  a.introducir_datos(2)
	  b.introducir_datos(2)
	end
	puts a.to_s
	puts b.to_s
	
      when 2
	puts "GENERAR MATRICES CON VALORES ALEATORIOS"
	puts "Introduce la dimension de la matriz 1: "
	print "Filas? "
	STDOUT.flush
	f=gets.chomp
	print "Columnas? "
	c=gets.chomp
	a = Matriz.new(f.to_i,c.to_i)
	puts "Introduce la dimension de la matriz 2: "
	print "Filas? "
	STDOUT.flush
	f=gets.chomp
	print "Columnas? "
	c=gets.chomp
	b = Matriz.new(f.to_i,c.to_i)
	
	op3=menu3
	case op3
	when 1
	  a.generar(1)
	  b.generar(1)
	when 2
	  a.generar(2)
	  b.generar(2)
	end
	puts a.to_s
	puts b.to_s

      when 3
	  op2=0
	  while (op2!=5)
	    op2= menu2
	    case op2
	      when 1
		puts "Suma"
		c = a+b
		puts "M1 + M2 = M3"
		puts a.to_s
		puts "+" 
		puts b.to_s
		puts "="
		puts c.to_s
	
		puts "Resta"
		c = a-b
		puts "M1 - M2 = M3"
		puts a.to_s
		puts "-" 
		puts b.to_s
		puts "="
		puts c.to_s
		pausa
	      when 2
		puts "Mutiplicacion por un escalar"
		print "Numero a multiplicar?: "
		STDOUT.flush
		num=gets.chomp
# 		c= a.escalar(num.to_i)
		num = num.to_i
		c= a*num
		puts "#{num.to_i} * M1 = M3"
		puts a.to_s
		puts c.to_s

		puts "Multiplicacion"
		c = a*b
		puts "M1 * M2 = M3"
		puts a.to_s
		puts "*" 
		puts b.to_s
		puts "="
		puts c.to_s
		pausa

	      when 3
		puts "Traspuesta de matrices"
		puts "M1"
		puts a.to_s
		puts "traspuesta M1"
		puts "#{a.t.to_s}"
		puts "M2"
		puts b.to_s
		puts "traspuesta M2"
		puts "#{b.t.to_s}"
 
		puts "Absoluto de una matriz"
		puts "M1"
		puts a.to_s
		puts "absoluto de M1"
		puts "#{a.abs.to_s}"
		pausa
	      when 4
		puts "Determinante"
		puts "M1"
		puts a.to_s
		puts "determinante de M1= #{a.det}"
		pausa
	    end
# 	    pausa
	  end
      when 4
	puts "MOSTRAR"
	puts "M1 = "
	puts a.to_s
	puts "M2 = "
	puts b.to_s
	if a==b
	  puts "Las matrices son iguales"
	else
	  puts "Las matrices son diferentes"
	end
    end
  pausa
  end
end

principal