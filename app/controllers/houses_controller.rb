class HousesController < ApplicationController
     def index 
          @houses = House.all
          render json: @houses
     end

     def show 
          @house = House.find(params[:id])
          render json: @house
     end

    def create
     @house = current_user.houses.build(house_params)
     if @house.save 
          render json: @house, status: :ok
     else
          render json: @house.errors, status: :unprocessable_entity
      end
    end

    def destroy 
     @house = House.find(params[:id])
     if @house.destroy
       render json: { message: 'House deleted successfully' }
     else
       render json: { error: 'Failed to delete the house' }, status: :unprocessable_entity
     end
   end

    private 
    def house_params
     params.require(:house).permit(:name, :bathroom, :bedroom, :address, :home_status, :home_type, :advertise, :price, :desc, :square, :zone, :floor, :tv, :bacon, :ac, images: [])
    end
end
