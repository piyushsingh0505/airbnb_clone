class ListingsController < ApplicationController
  # 1. Sirf unhi actions ko rakhein jo niche DEFINE kiye gaye hain
  before_action :set_listing, only: %i[ show edit update destroy ]

  def index
    @listings = Listing.all

    # Location Filter
    if params[:city].present?
      @listings = @listings.where("lower(city) LIKE ?", "%#{params[:city].downcase}%")
    end

    # Guests Filter
    if params[:guests].present?
      @listings = @listings.where("max_guests >= ?", params[:guests].to_i)
    end
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def edit
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to @listing, notice: "Listing was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 2. YEH METHOD MISSING THA (Iske bina error aa raha tha)
  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: "Listing was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_url, notice: "Listing was successfully destroyed."
  end

  private

  def set_listing
    # Ensure id exists before finding
    @listing = Listing.find(params[:id])
  end

  def listing_params
    # Apne database columns ke hisaab se permit karein
    params.require(:listing).permit(:city, :state, :country, :headline, :price_cents, :image_url, :rating, :max_guests)
  end
end
