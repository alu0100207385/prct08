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
	puts a.to_s
	a.introducir_datos
	puts a.to_s
	
	puts "Introduce la dimension de las matriz 2: "
	print "Filas? "
	STDOUT.flush
	f=gets.chomp
	print "Columnas? "
	c=gets.chomp
	b = Matriz.new(f.to_i,c.to_i)
	puts b.to_s
	b.introducir_datos
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
	a.generar
	puts a.to_s

	puts "Introduce la dimension de la matriz 2: "
	print "Filas? "
	STDOUT.flush
	f=gets.chomp
	print "Columnas? "
	c=gets.chomp
	b = Matriz.new(f.to_i,c.to_i)
	b.generar
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
		pausa

	      when 4
		puts "Determinante"
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
    end
  pausa
  end
end

principal