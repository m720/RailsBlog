class V1::User::BaseController < ApplicationController
    before_action :authenticate_user!
    
end
