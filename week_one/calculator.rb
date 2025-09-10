class Calculator 
  attr_reader :history

  def initialize
    @history = []
  end

  def add(a, b) 
    result = a + b
    record_operation("add", a, b, result)
    result
  end

  def subtract(a,b)
    result = a - b 
    record_operation("subtract", a, b, result)
    result
  end

  def multiply(a , b)
    result = a * b 
    record_operation("multiply", a, b, result)
    result
  end

  def divide(a,b) 
    if b == 0
      puts 'Error: Division by zero'
      return nil 
    end
    result = a / b
    record_operation("divide", a, b, result)
    result
  end

  def show_history
    if @history.empty?
      puts "No calculations yet"
    else
      puts "Calcultaion History :"
      @history.each_with_index do |operation, index|
        puts "#{index + 1}. #{operation}"
      end
    end
  end

  def clear_history 
    @history.clear
    puts "HISTORY CLEARED"
  end

  private 

  def record_operation(operation, a,b, result)
    @history << " #{a} #{operation_symbol(operation)} #{b} = #{result}"
  end

  def operation_symbol
    case operation
    when "add" then "+"
    when "subtract" then "-"
    when "divide" then "/"
    when "multiply" then "*"
    end
  end
end

def run_calcultator
  calc = Calculator.new

  loop do
    puts "\nCalculator Menu:"
    puts "1. Add"
    puts "2. Subtract"
    puts "3. Multiply"
    puts "4. Divide"
    puts "5. Show History"
    puts "6. Clear History"
    puts "7. Exit"

    print "Choose an option (1-7): "
    choice = gets.chomp.to_i

    case choice
    when 1..4
      print "Enter first number: "
      num1 = gets.chomp.to_f
      print "Enter second number: "
      num2 = gets.chomp.to_f

      result = case choice
               when 1 then calc.add(num1, num2)
               when 2 then calc.subtract(num1, num2)
               when 3 then calc.multiply(num1, num2)
               when 4 then calc.divide(num1, num2)
               end

      puts "Result: #{result}" unless result.nil?

    when 5
      calc.show_history

    when 6
      calc.clear_history

    when 7
      puts "Goodbye!"
      break

    else
      puts "Invalid option! Please choose 1-7."
    end
  end
end
run_calcultator