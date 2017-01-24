class BasicCalculator

  def self.run(expr)
    return nil if expr.blank?
    return expr.to_f if is_number?(expr)

    expr.gsub!(/\s+/, '')

    ['+', '-', '*', '/'].each do |op|
      arr = expr.split(op)
      return arr.inject { |x, y| run(x).send(op, run(y)) } if arr.length > 1
    end

    nil
  end

  def self.is_number?(string)
    true if Float(string) rescue false
  end

end