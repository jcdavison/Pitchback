class PitchesController < ApplicationController
  # GET /pitches
  # GET /pitches.json
  def index
    @pitches = Pitch.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pitches }
    end
  end

  # GET /pitches/1
  # GET /pitches/1.json
  def show
    @pitch = Pitch.find(params[:id])
    @publisher = params[:publisher]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pitch }
    end
  end

  # GET /pitches/new
  # GET /pitches/new.json
  def new
    @pitch = Pitch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pitch }
    end
  end

  # GET /pitches/1/edit
  def edit
    @pitch = Pitch.find(params[:id])
  end

  # POST /pitches
  # POST /pitches.json
  def create
    @pitch = Pitch.new(params[:pitch])
    @pitch.request_ip = request.ip
    respond_to do |format|
      if @pitch.save
        format.html { redirect_to pitch_path @pitch, publisher: true }
        format.json { render json: @pitch, status: :created, location: @pitch }
      else
        format.html { render action: "new" }
        format.json { render json: @pitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pitches/1
  # PUT /pitches/1.json
  def update
    @pitch = Pitch.find(params[:id])

    respond_to do |format|
      if @pitch.update_attributes(params[:pitch])
        format.html { redirect_to @pitch, notice: 'Pitch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pitches/1
  # DELETE /pitches/1.json
  def destroy
    @pitch = Pitch.find(params[:id])
    @pitch.destroy

    respond_to do |format|
      format.html { redirect_to pitches_url }
      format.json { head :no_content }
    end
  end
end
