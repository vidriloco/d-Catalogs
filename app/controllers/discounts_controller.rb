class DiscountsController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /discounts
  def index
    @discounts = Discount.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /discounts/1
  def show
    @discount = Discount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /pre_sales/1/discounts/new
  def new
    @discount = Discount.new_with(params)

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /pre_sales/1/discounts/1/edit
  def edit
    @discount = Discount.find(params[:id])
  end

  # POST /discounts
  def create
    @discount = Discount.new(params[:discount])

    respond_to do |format|
      if @discount.save
        format.html { redirect_to @discount.discountable, notice: I18n.t('app.views.discounts.messages.create.success') }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /discounts/1
  def update
    @discount = Discount.find(params[:id])

    respond_to do |format|
      if @discount.update_attributes(params[:discount])
        format.html { redirect_to @discount.discountable, notice: I18n.t('app.views.discounts.messages.update.success') }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /discounts/1
  def destroy
    @discount = Discount.find(params[:id])
    @discount.destroy

    respond_to do |format|
      format.html { redirect_to @discount.discountable }
    end
  end
end
