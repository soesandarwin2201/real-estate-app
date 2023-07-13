class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.includes(:phones).all
    render json: @users.to_json(include: :phones), status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user.to_json(include: :phones), status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      id = @user.id

      phones = params[:phones] # Check the value of params[:phones]
      puts "Phones received: #{phones.inspect}" # Print the phones for debugging

      @phones = phones.map do |phone|
        Phone.create!(number: phone.to_i, user_id: id)
      end

      Phone.import(@phones) # Use `import` for bulk insertion
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    render json: @user, serializer: UserShowSerializer, status: :accepted
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  def google
    puts "Received google sign-in request"
    access_token = params[:access_token]
    puts "Access token: #{access_token}"
    begin
      data = Google::Auth::IDTokens.verify_oidc(access_token, aud: 'YOUR_GOOGLE_CLIENT_ID')
      puts "Token verification successful"
      puts "Data: #{data.inspect}"

      # Find or create the user based on the received data
      user = User.find_by(email: data['email'])

      if user.nil?
        user = User.new(email: data['email'], name: data['name'])

        if user.save
          puts "New user created: #{user.email}"
        else
          puts "User creation failed. Errors: #{user.errors.full_messages}"
          # Handle the validation errors appropriately
        end
      else
        puts "User found: #{user.email}"
      end
    rescue StandardError => e
      puts "Token verification failed: #{e.message}"
    end
  end

  private

  def find_user
    @user = User.includes(:phones).find_by!(username: params[:username])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
      :name, :username, :email, :password, :password_confirmation, :address, :details, :company_name, :avatar, :phones
    )
  end
end

