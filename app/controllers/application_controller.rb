class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("number")
    @square_of_num = @num.to_f ** 2
    render({:template => "calculation_templates/square_results.html.erb"})
  end
end
