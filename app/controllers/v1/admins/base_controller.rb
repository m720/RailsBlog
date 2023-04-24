class V1::Admins::BaseController < ApplicationController
    before_action :authenticate_admin!
    
end
