class UsersController < ApplicationController
     before_action :authorize_request, except: :create
     before_action :find_user, except: %i[create index]

  # GET /users
  def index
     @users = User.includes(:phones).all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create 
     @user = User.new(user_params)
     if @user.save
       id = @user.id
   
       @phones = params[:phones].map do |phone| 
         Phone.create!(number: phone, user_id: id)
       end
   
       Phone.import(@phones) # Use `import` for bulk insertion
       render json: @user, status: :created
     else 
       render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
     end
   end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  private

  def find_user
     @user = User.includes(:phones).find_by!(name: params[:name])
   rescue ActiveRecord::RecordNotFound
     render json: { errors: 'User not found' }, status: :not_found
   end

  def user_params
    params.permit(
     :name, :username, :email, :password, :password_confirmation, :address, :details, :company_name, phones: []
    )
  end
end
