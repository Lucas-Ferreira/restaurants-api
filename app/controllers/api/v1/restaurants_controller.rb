class Api::V1::RestaurantsController < Api::V1::BaseController
  #skip_before_action :verify_authenticity_token
  acts_as_token_authentication_handler_for User
  #skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_restaurant, only: [ :show, :update ]
  #before_action :authenticate_user!


  def index
    @restaurants = policy_scope(Restaurant)
  end
  def show
    @restaurant = Restaurant.find(params[:id])
    p ">>>>> #{@restaurant}"
    authorize @restaurant
  end
  def update
    if @restaurant.update(restaurant_params)
      render :show
    else
      render_error
    end
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end
end
