class CalcController < ApplicationController
  def homepage
    render({ :template => "calc_templates/home"})
  end
  def square_new
    render({ :template => "calc_templates/square_new"})
  end
  def square_results
    @square_num = params.fetch("number").to_f
    @squared = @square_num ** 2
    render({ :template => "calc_templates/square_results"})
  end
  def root_new
    render({ :template => "calc_templates/root_new"})
  end
  def root_results
    @root_num = params.fetch("user_number").to_f
    @rooted = @root_num ** 0.5
    render({ :template => "calc_templates/root_results"})
  end
  def payment_new
    render({ :template => "calc_templates/payment_new"})
  end
  def payment_results
    @apr = params.fetch("user_apr").to_f 
    @years = params.fetch("user_years").to_i
    @principal = params.fetch("user_pv").to_f
    num = @apr * @principal/1200
    denom = 1 - (1 + @apr/1200) ** (@years * -12)
    @payment = num / denom
    @apr = @apr.to_fs(:percentage, {:precision => 4})
    @principal = @principal.to_fs(:currency, {:precision => 2})
    @payment = @payment.to_fs(:currency, {:precision => 2})
    render({ :template => "calc_templates/payment_results"})
  end
  def random_new
    render({ :template => "calc_templates/random_new"})
  end
  def random_results
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
    @random_num = rand(@min..@max).to_f
    render({ :template => "calc_templates/random_results"})
  end
end
