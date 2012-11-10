# encoding: UTF-8
class DailySalesController < ApplicationController
  
  before_filter :authenticate_user!

  # GET /daily_sales
  # GET /daily_sales.json
  def index
    @daily_sales = DailySale.all

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
    6.times { @daily_sale.sales.build }
    @default_products = [ "Suppe 1 klein", "Suppe 1 groß", 
    					"Suppe 2 klein", "Suppe 2 groß", 
    					"Suppe 3 klein", "Suppe 3 groß"]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @daily_sale }
    end
  end

  # GET /daily_sales/1/edit
  def edit
    @daily_sale = DailySale.find(params[:id])
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
    @daily_sale.destroy

    respond_to do |format|
      format.html { redirect_to daily_sales_url }
      format.json { head :no_content }
    end
  end
end
