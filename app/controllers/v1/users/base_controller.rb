class V1::Users::BaseController < ApplicationController
    before_action :authenticate_user!
    
end
