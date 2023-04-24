class V1::Admins::UsersController < V1::Admins::BaseController
    before_action :set_user, only: %i(show update destroy)

    def index
      @users = User.all
      paginate collection: @users
    end

    def show
      render(json: @user)
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render(json: @user, status: :created)
      else
        render(json: @user.errors, status: :unprocessable_entity)
      end
    end

    def update
      if @user.update(user_params.except(:email))
        render(json: @user, status: :created)
      else
        render(json: @user.errors, status: :unprocessable_entity)
      end
    end

    def destroy
      @user.destroy
    end

    private
      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
      end
end
