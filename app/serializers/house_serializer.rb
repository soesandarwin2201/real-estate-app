class HouseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :bathroom, :bedroom, :address, :home_status, :home_type, :advertise, :price, :desc, :square, :zone, :floor, :tv, :bacon, :ac, :images 

  def images 
    object.images.map { |image| url_for(image) if image.blob.present? }
  end
end
