# class to get Regegular expressions
class Rgx
  attr_reader :txt

  def initialize(txt)
    @txt = txt
  end

  def reg_exp
    path = File.join 'HW_03', 'Stanislav_Sharkov'
    IO.read(File.join(path, txt)).each_line.select do |line|
      /#{line.chomp}/
    end
  end

  def valid_output
    reg_exp.map { |el| /#{el.chomp}/ }
    # arr[0] - its ip; arr[1] its datetime; arr[2] its catalog
  end
end

# class to get Result with help Regegular expressions
class Result
  attr_reader :re_in, :re_o, :input

  def initialize(re_in, re_o, input)
    @re_in = re_in
    @re_o = re_o
    @input = input
  end

  def valid_arr
    full = /#{re_in[0].chomp} #{re_in[1].chomp} #{re_in[2].chomp}/
    input.each_line.select do |line|
      line.match?(full)
    end
  end

  def result
    valid_arr.collect do |el|
      "#{el[re_o[1]]} FROM: #{el[re_o[0]]} TO: #{el[re_o[2]].upcase[0..-2]}"
    end
  end
end

def task_2(str)
  re_in = Rgx.new('rgx_input.txt').reg_exp
  re_o = Rgx.new('rgx_output.txt').valid_output
  Result.new(re_in, re_o, str).result
end
