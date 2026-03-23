class HomeController < ApplicationController
  def index
    # Search logic city ke liye
    if params[:city].present?
      @properties = Property.where("lower(city) LIKE ?", "%#{params[:city].downcase}%")
    else
      @properties = Property.all
    end
  end
end
