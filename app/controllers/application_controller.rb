class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("number")
    @square_of_num = @num.to_f ** 2
    render({:template => "calculation_templates/square_results.html.erb"})
  end

  def blank_random_form
    render({:template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_random
    @user_min = params.fetch("user_min").to_f
    @user_max = params.fetch("user_max").to_f
    @random_result = rand(@user_min..@user_max)
    render({:template => "calculation_templates/random_results.html.erb"})
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb"})
  end

  def calculate_square_root
    @num = params.fetch("user_number")
    @square_root_of_num = @num.to_f ** 0.5
    render({:template => "calculation_templates/square_root_results.html.erb"})
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

 
  def calculate_payment
    apr = params.fetch("user_apr").to_f
    years = params.fetch("user_years").to_f
    principal = params.fetch("user_pv").to_f
    period_rate = apr / 100.0 / 12
    months = years * 12.0
    monthly_payment = (period_rate * principal) / (1 - (1 + period_rate)**(months * -1))

    @apr_text = apr.round(4).to_s + "%" #sprintf("%2.4f", apr) + "%"
    #@apr_text = apr.to_s(:percentage)
    @years_text = years.to_i
    @principal_text = principal.to_s(:currency)
    #@principal_text = sprintf("$%2.2f", principal)
    @monthly_payment_text = monthly_payment.to_s(:currency)
    

    render({:template => "calculation_templates/payment_results.html.erb"})
  end
end
