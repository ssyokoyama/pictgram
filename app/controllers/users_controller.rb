class UsersController < ApplicationController
validates :password, length: { in: 8..32 }
validates :email, presence: true, format: {with: /\w+@\w+\.\w+/}
validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i}
validates :name, presence: true, length: { maximum: 15 }
end
  def new
    @user = User.new
  end

  def create

  @user = User.new(user_params)
  if @user.save
    redirect_to root_path, success: '登録が完了しました'
  else
    flash.now[:danger] = "登録に失敗しました"
    render :new
  end
end

private
 def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
 end
end
