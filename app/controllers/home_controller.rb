class HomeController < ApplicationController
  def index
    expr = params[:expression]
    @result = expr.present? ? BasicCalculator.run(expr) : nil
  end
end
