class BarberShopsController < ApplicationController
  before_action :set_barber_shop, only: %i[ show edit update destroy ]

  # GET /barber_shops or /barber_shops.json
  def index
    @barber_shops = BarberShop.all
  end

  # GET /barber_shops/1 or /barber_shops/1.json
  def show
  end

  # GET /barber_shops/new
  def new
    @barber_shop = BarberShop.new
  end

  # GET /barber_shops/1/edit
  def edit
  end

  # POST /barber_shops or /barber_shops.json
  def create
    @barber_shop = BarberShop.new(barber_shop_params)

    respond_to do |format|
      if @barber_shop.save
        format.html { redirect_to @barber_shop, notice: "Barber shop was successfully created." }
        format.json { render :show, status: :created, location: @barber_shop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @barber_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barber_shops/1 or /barber_shops/1.json
  def update
    respond_to do |format|
      if @barber_shop.update(barber_shop_params)
        format.html { redirect_to @barber_shop, notice: "Barber shop was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @barber_shop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @barber_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barber_shops/1 or /barber_shops/1.json
  def destroy
    @barber_shop.destroy!

    respond_to do |format|
      format.html { redirect_to barber_shops_path, notice: "Barber shop was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barber_shop
      @barber_shop = BarberShop.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def barber_shop_params
      params.expect(barber_shop: [ :name, :document, :address, :city, :phone ])
    end
end
