class Api::V1::ReviewsController < ApplicationController
  #acts_as_token_authentication_handler_for User, except: [ :index ]
  def index
    @reviews = policy_scope(Review)
    #p " >>>> #{@review.each {|r| r.content}} "
  end
  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    p ">>>>> #{params}"
    authorize @restaurant
  end
end
