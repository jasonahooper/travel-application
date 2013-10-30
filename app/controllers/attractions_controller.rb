class AttractionsController < ApplicationController
  # GET /attractions
  # GET /attractions.json
  def index
    @attractions = Destination.find(params[:destination_id]).attractions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attractions }
    end
  end

  # GET /attractions/1
  # GET /attractions/1.json
  def show
    @attraction = Attraction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attraction }
    end
  end

  # GET /attractions/new
  # GET /attractions/new.json
  def new
    @attraction = Attraction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attraction }
    end
  end

  # GET /attractions/1/edit
  def edit
    @attraction = Attraction.find(params[:id])
  end

  # POST /attractions
  # POST /attractions.json
  def create
    @attraction = Attraction.new(params[:attraction])
    @attraction.destination_id = params[:destination_id]

    respond_to do |format|
      if @attraction.save
        format.html { redirect_to destination_attraction_path(params[:destination_id], @attraction), notice: 'Attraction was successfully created.' }
        format.json { render json: @attraction, status: :created, location: @attraction }
      else
        format.html { render action: "new" }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attractions/1
  # PUT /attractions/1.json
  def update
    @attraction = Attraction.find(params[:id])

    respond_to do |format|
      if @attraction.update_attributes(params[:attraction])
        format.html { redirect_to destination_attraction_path(@attraction.destination_id, @attraction), notice: 'Attraction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attractions/1
  # DELETE /attractions/1.json
  def destroy
    @attraction = Attraction.find(params[:id])
    @attraction.destroy

    respond_to do |format|
      format.html { redirect_to destination_attractions_path(@attraction.destination_id) }
      format.json { head :no_content }
    end
  end
end
