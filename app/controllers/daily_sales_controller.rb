# encoding: UTF-8
class DailySalesController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :daily_sales_rights, :only => [:index, :new, :show, :create]
  #before_filter :admin_rights, :only => [:edit, :update, :destroy]

  # GET /daily_sales
  # GET /daily_sales.json
  def index
    if current_user.admin?
      @daily_sales = DailySale.all
    else
      sales = Sale.where(:user_id => current_user.id)
      @daily_sales = []
      sales.each do |sale|
        unless @daily_sales.include?(DailySale.find(sale.daily_sale_id))
          @daily_sales << DailySale.find(sale.daily_sale_id)
        end
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @daily_sales }
    end
  end

  # GET /daily_sales/1
  # GET /daily_sales/1.json
  def show
    @daily_sale = DailySale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @daily_sale }
    end
  end

  # GET /daily_sales/new
  # GET /daily_sales/new.json
  def new
    @daily_sale = DailySale.new
    12.times { @daily_sale.sales.build }

    @default_products = [ "Suppe 1 klein", "Suppe 1 groß",
                          "Suppe 2 klein", "Suppe 2 groß",
                          "Suppe 3 klein", "Suppe 3 groß",
                          "Suppe 4 klein", "Suppe 4 groß",
                          "Suppe 5 klein", "Suppe 5 groß",
                          "Suppe 6 klein", "Suppe 6 groß"
                          ]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @daily_sale }
    end
  end

  # GET /daily_sales/1/edit
  def edit
    @daily_sale = DailySale.find(params[:id])
    own_sales = @daily_sale.sales.where(:user_id => current_user.id)
    if own_sales.empty?
      flash[:error] = "Zu bearbeitende Umsätze stammen nicht von dir!"
      redirect_to daily_sales_path
    end
  end

  # POST /daily_sales
  # POST /daily_sales.json
  def create
    @daily_sale = DailySale.new(params[:daily_sale])

    respond_to do |format|
      if @daily_sale.save
        format.html { redirect_to @daily_sale, notice: 'Daily sale was successfully created.' }
        format.json { render json: @daily_sale, status: :created, location: @daily_sale }
      else
        format.html { render action: "new" }
        format.json { render json: @daily_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /daily_sales/1
  # PUT /daily_sales/1.json
  def update
    @daily_sale = DailySale.find(params[:id])

    respond_to do |format|
      if @daily_sale.update_attributes(params[:daily_sale])
        format.html { redirect_to @daily_sale, notice: 'Daily sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @daily_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_sales/1
  # DELETE /daily_sales/1.json
  def destroy
    @daily_sale = DailySale.find(params[:id])
    own_sales = @daily_sale.sales.where(:user_id => current_user.id)
    if own_sales.empty?
      flash[:error] = "Zu bearbeitende Umsätze stammen nicht von dir!"
      redirect_to daily_sales_path
    else
      @daily_sale.destroy

      respond_to do |format|
        format.html { redirect_to daily_sales_url }
        format.json { head :no_content }
      end
    end
  end
end
