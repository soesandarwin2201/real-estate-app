class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :username, :email, :password, :password_confirmation, :address, :details, :company_name, :avatar

  def avatar 
    if object.avatar.blob.present?
      url_for(object.avatar)
      else
        nil
      end
  end
end
