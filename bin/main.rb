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