class UsersController < ApplicationController
  # 對應到 action #index
  def index
    @users = User.all
  end

  # 對應到 action #new
  def new
    @user = User.new
  end

  # 對應到 action #create
  def create
    @user = User.new(user_params)
    # @user.save
    if @user.save
      redirect_to(users_path, notice: "建立使用者資料成功~~~~~~!")
    else
      render :new
    end
  end

  # 對應到 action #show
  def show
    @user = User.find_by(id:params[:id])
    # 與上面個結果相同
    # @user = User.find(params[:id])
  end

  # 對應到 action #edit
  def edit
    @user = User.find_by(id:params[:id])
  end

  # 對應到 action #update
  def update
    @user = User.find_by(id:params[:id])
    if @user.update_attributes(user_params)
      # 更新完成後將網頁重新導向到 該 user 的 show 頁面，所以這邊給的連結是 user_path(@user.id)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  # 對應到 action #destroy
  def destroy
    @user = User.find_by(id:params[:id])
    @user.destroy

    # 刪除使用者資料後，將網頁重新導向至首頁
    redirect_to users_path
  end

  # 限制輸入參數
  private
  def user_params
    params.require(:user).permit(:name, :mail, :gender, :age)
  end
end
