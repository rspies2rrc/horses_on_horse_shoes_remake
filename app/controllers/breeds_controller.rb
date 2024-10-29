class BreedsController < ApplicationController
  # GET /
  # GET /breeds
  def index
    @breeds = Breed.all
  end

  # GET /breeds/:id
  def show
    @breed = Breed.find(params[:id])
  end
end
