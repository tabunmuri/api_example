class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /api/users
  # GET /api/users.json
  def index
    @users = User.all
    render :json => @users
  end

  # GET /api/users/1
  # GET /api/users/1.json
  def show
    if @user.blank?
      render :json => @user
    else
      render :json => {}
    end
  end

  # POST /api/users
  # POST /api/users.json
  def create
    # ユーザのインスタンスを作る
    @user = User.new(user_params)

    # ユーザのデータを保存する
    if @user.save
      render :json => @user
    else
      render :json => {status:500}
    end
  end

  # PATCH/PUT /api/users/1
  # PATCH/PUT /api/users/1.json
  def update
    if @user.update(user_params)
      render :json => @user
    else
      render :json => {status:500}
    end
  end

  # DELETE /api/users/1
  # DELETE /api/users/1.json
  def destroy
    @user.destroy
    render :json => {status:200}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      # 下記のようにすることで、paramsで実行していたpermitと同様のことができる
      json_request = ActionController::Parameters.new(JSON.parse(request.body.read))
      json_request.permit(:name, :email, :password)
    end
end
