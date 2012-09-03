class MusicBoxesController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /music_boxes
  # GET /music_boxes.json
  def index
    @music_boxes = MusicBox.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @music_boxes }
    end
  end

  # GET /music_boxes/1
  # GET /music_boxes/1.json
  def show
    @music_box = MusicBox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @music_box }
    end
  end

  # GET /music_boxes/new
  # GET /music_boxes/new.json
  def new
    @music_box = MusicBox.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @music_box }
    end
  end

  # GET /music_boxes/1/edit
  def edit
    @music_box = MusicBox.find(params[:id])
  end

  # POST /music_boxes
  # POST /music_boxes.json
  def create
    @music_box = MusicBox.new(params[:music_box])

    respond_to do |format|
      if @music_box.save
        format.html { redirect_to @music_box, notice: 'Music box was successfully created.' }
        format.json { render json: @music_box, status: :created, location: @music_box }
      else
        format.html { render action: "new" }
        format.json { render json: @music_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /music_boxes/1
  # PUT /music_boxes/1.json
  def update
    @music_box = MusicBox.find(params[:id])

    respond_to do |format|
      if @music_box.update_attributes(params[:music_box])
        format.html { redirect_to @music_box, notice: 'Music box was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @music_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /music_boxes/1
  # DELETE /music_boxes/1.json
  def destroy
    @music_box = MusicBox.find(params[:id])
    @music_box.destroy

    respond_to do |format|
      format.html { redirect_to music_boxes_url }
      format.json { head :no_content }
    end
  end
end
