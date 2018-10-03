class Administrator::BaseController < ApplicationController
  before_action :authorize_admin

end
