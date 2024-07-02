class DemoPartialsController < ApplicationController
  def new
  	@zone = "New Zone action"
  	@date = Date.today
  end

  def edit
  	@zone = "New Zone action"
  	@date = Date.today - 4
  end
end
