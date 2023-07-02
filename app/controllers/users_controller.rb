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
  
      phones = params[:phones] # Check the value of params[:phones]
      puts "Phones received: #{phones.inspect}" # Print the phones for debugging
  
      @phones = phones.map do |phone| 
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

  def google 
    begin
      data = Google:Auth::IDToken.verify_oidc(access_token, aud: '203263028732-1hkgorsrn4fogvtufmqicskt6ud1kvca.apps.googleusercontent.com')
      rescue StandardError => e
    end
    rescue => exception
      
    else
      
    end
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
