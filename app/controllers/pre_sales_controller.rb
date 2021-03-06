class PreSalesController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /pre_sales
  # GET /pre_sales.json
  def index
    @pre_sales = PreSale.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pre_sales }
    end
  end

  # GET /pre_sales/1
  # GET /pre_sales/1.json
  def show
    @pre_sale = PreSale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pre_sale }
    end
  end

  # GET /pre_sales/new
  # GET /pre_sales/new.json
  def new
    @pre_sale = PreSale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pre_sale }
    end
  end

  # GET /pre_sales/1/edit
  def edit
    @pre_sale = PreSale.find(params[:id])
  end

  # POST /pre_sales
  # POST /pre_sales.json
  def create
    @pre_sale = PreSale.new_with(params[:pre_sale], params[:date])

    respond_to do |format|
      if @pre_sale.save
        format.html { redirect_to @pre_sale, notice: I18n.t('app.views.pre_sales.messages.create.success') }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /pre_sales/1
  # PUT /pre_sales/1.json
  def update
    @pre_sale = PreSale.find(params[:id])

    respond_to do |format|
      if @pre_sale.update_attributes_with(params[:pre_sale], params[:date])
        format.html { redirect_to @pre_sale, notice: I18n.t('app.views.pre_sales.messages.update.success') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pre_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_sales/1
  # DELETE /pre_sales/1.json
  def destroy
    @pre_sale = PreSale.find(params[:id])
    @pre_sale.destroy

    respond_to do |format|
      format.html { redirect_to pre_sales_url }
      format.json { head :no_content }
    end
  end
end
