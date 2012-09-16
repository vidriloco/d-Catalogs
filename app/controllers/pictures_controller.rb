class PicturesController < ApplicationController
  # GET /pictures
  def index
    @pictures = Picture.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /pictures/1
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /pictures/new
  def new
    @picture = Picture.new_with(params)

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
  end

  # POST /pictures
  def create
    @picture = Picture.new(params[:picture])

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture.imageable, notice: I18n.t('app.views.pictures.messages.create.success') }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /pictures/1
  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to @picture.imageable, notice: I18n.t('app.views.pictures.messages.update.success') }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /pictures/1
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to @picture.imageable }
    end
  end
end
