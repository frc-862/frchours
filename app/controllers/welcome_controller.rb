class WelcomeController < ApplicationController
  before_action :auth_admin!, :except => [:index]

  def index
  end
end
