
def menu
      puts "*********************************************************************"
	    puts "*  Bienvenido por favor seleccione una de las siguientes opciones   *"
      puts "*********************************************************************"
      puts "           1: generar archivo de alumnos                            *"
      puts "           2: Cantidad de inacistencia                              *"                                        
      puts "           3: alumnos aprobrados                                    *"
      puts "           4: salir                                                 *"
      puts "*********************************************************************"
end

opcion_sel = 0
def seleccion_opcion
    opcion_elegida = gets.chomp
    opcion_transformado = (opcion_elegida.to_f).to_i
    while !(0 < opcion_transformado)
        puts "Tu opcion elegida es #{opcion_elegida}"
        puts "Debes escoger un número entre 1 y 4"
        opcion_elegida = gets.chomp
        opcion_transformado = opcion_elegida.to_i
      end
      return opcion_transformado
    end

#opcion1
def generar_archivo_alumno_y_promedio
   lines = []
   archivo = File.open('Alumnos.csv', 'r') { |file| lines = file.readlines.map(&:chomp) }
   estudiante = lines.map { |line| line.delete(' ').split(',') } 

   archivo = File.open('promedio_estudiantes.txt','w')
   estudiante.each do |elemento|
    p nombre = elemento.first
    notas = elemento[1..5]

    promedio = 0
    suma = 0

  notas.each do |elemento|
    suma += elemento.to_i
   end
   p promedio = suma / 5.to_f

   archivo.write "el promedio del estudiante #{nombre} es: "
   archivo.write "#{promedio} \n"
 end
 archivo.close
end

#opcion2
def cuenta_inacistencia
  lines = []
  archivo = File.open('Alumnos.csv', 'r') { |file| lines = file.readlines.map(&:chomp) }
  estudiante = lines.map { |line| line.delete(' ').split(',') } 
    
    inacistencia = 0

    estudiante.each do |elemento|
     nombre = elemento.first
     notas = elemento [1..5]
    
    notas.each do |elemento|
      
      if elemento == "A"
        inacistencia += 1
      end
    end
    end
    p 'la cantidad de inacistencias son: ', inacistencia
end

#opcion3
def cuenta_aprobado
  lines = []
  archivo = File.open('Alumnos.csv', 'r') { |file| lines = file.readlines.map(&:chomp) }
  estudiante = lines.map { |line| line.delete(' ').split(',') } 

  puts "escoja el numero de rango de promedio"
  numero = gets.chomp.to_i

  if numero != 0
      aprobado = 0

      estudiante.each do |elemento|
      nombre = elemento.first
      notas = elemento[1..5]

      promedio = 0
      suma = 0

      notas.each do |elemento|
      suma += elemento.to_i
      end
      p nombre
      puts promedio = (suma / 5.to_f)

       if promedio >= numero
        aprobado += 1
       end
     end
     p 'numero de persona aprobada:', aprobado  
   else
       numero = 5
       aprobado = 0
       estudiante.each do |elemento|
       nombre = elemento.first
       notas = elemento[1..5]

       promedio = 0
       suma = 0

       notas.each do |elemento|
       suma += elemento.to_i
       end
       p nombre
       puts promedio = (suma / 5.to_f)

       if promedio >= numero
       aprobado += 1
         end
       end
       p 'numero de persona aprobada:', aprobado  
  end
end
 
menu

while(opcion_sel != 4)  do 
  opcion_sel = seleccion_opcion
	
	case opcion_sel
    when 1
        generar_archivo_alumno_y_promedio
        menu  
    when 2
        cuenta_inacistencia
        menu
        
    when 3
        cuenta_aprobado
        menu
       
   when 4
   	puts "elegiste salir"
   	break
    end
end
	






