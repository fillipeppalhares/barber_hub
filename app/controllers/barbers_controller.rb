class BarbersController < ApplicationController
  before_action :set_barber, only: %i[show edit update destroy edit_weekly_schedule update_weekly_schedule bookable_days bookable_slots]

  def index
    @barbers = Barber.all
  end

  def show
  end

  def new
    @barber = Barber.new
  end

  def edit
  end

  def create
    @barber = Barber.new(barber_params)

    respond_to do |format|
      if @barber.save
        format.html { redirect_to @barber, notice: "Barber was successfully created." }
        format.json { render :show, status: :created, location: @barber }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @barber.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @barber.update(barber_params)
        format.html { redirect_to @barber, notice: "Barber was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @barber }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @barber.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @barber.destroy!

    respond_to do |format|
      format.html { redirect_to barbers_path, notice: "Barber was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def edit_weekly_schedule
    @weekly_schedule = @barber.schedules.grouped_by_weekday
  end

  def update_weekly_schedule
    respond_to do |format|
      if @barber.update(weekly_schedule_params)
        format.html { redirect_to @barber, notice: "Weekly Schedule was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @barber }
      else
        format.html { render :edit_weekly_schedule, status: :unprocessable_entity }
        format.json { render json: @barber.errors, status: :unprocessable_entity }
      end
    end
  end

  def bookable_days
    @service = set_service
    @period = Period.from_param(params[:period])
    @bookable_days = @barber.bookable_days(period: @period, duration: @service.duration)
  end

  def bookable_slots
    day = DateTime.parse(params[:day])
    @service = set_service
    # @schedule = @barber.schedules_on(params[:day])
    @bookable_slots = @barber.bookable_slots(day:, duration: @service.duration)
  end

  private

  def set_barber
    @barber = Barber.find(params.expect(:id))
  end

  def set_service
    Service.find(params[:service_id])
  end

  def barber_params
    params.expect(barber: [:name, :active, :barber_shop_id])
  end

  def weekly_schedule_params
    params.require(:barber).permit(schedules_attributes: %i[id start_time end_time])
  end
end
