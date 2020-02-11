class Questionary
  attr_reader :file

  def initialize(file)
    @question_list = []
    @file = file  
    read  
  end  
  
  def take!
    @question_list.shift.strip.upcase 
  end
  
  private
  def read
    if File.exist?(@file)      
      @question_list = IO.readlines(@file)      
    else
      nil
      puts "El archivo con las preguntas no existe"
    end
  end
end

class ReadLine
  def initialize (questionary)
    @questionary = questionary
    @question_answer_list = []
  end
  
  def hit!
    @question_answer_list.push(@questionary.take!)   
  end
end

questionary = Questionary.new('q.txt')
read_line = ReadLine.new(questionary)

puts "Bienvenido a reto 5, Para jugar, solo ingresa la respuesta correcta para cada una de las preguntas, Listo? Vamos!"

count = 0;
limit = 5
limit.times do |i|
  puts
  count += 1
  puts "#{count} Definición:"
  print " #{read_line.hit!.last}"
  puts
  print " Adivinar: "
  answer = gets.chomp.upcase 
  last = read_line.hit!.last

  while answer != last
    puts "Incorrecto!, Trata de nuevo"
    print " Adivinar: "
    answer = gets.chomp.upcase
  end
  puts "Correcto!"
end

