class PermanenceTimesController < ApplicationController

  load_and_authorize_resource

  before_action :set_permanence_time, only: [:show, :edit, :update, :destroy]

  # GET /permanence_times
  # GET /permanence_times.json
  def index
    @permanence_times = PermanenceTime.all
  end

  # GET /permanence_times/1
  # GET /permanence_times/1.json
  def show
  end

  # GET /permanence_times/new
  def new
    @permanence_time = PermanenceTime.new
  end

  # GET /permanence_times/1/edit
  def edit
  end

  # POST /permanence_times
  # POST /permanence_times.json
  def create
    @permanence_time = PermanenceTime.new(permanence_time_params)

    respond_to do |format|
      if @permanence_time.save
        format.html { redirect_to @permanence_time, notice: 'Permanence time was successfully created.' }
        format.json { render :show, status: :created, location: @permanence_time }
      else
        format.html { render :new }
        format.json { render json: @permanence_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permanence_times/1
  # PATCH/PUT /permanence_times/1.json
  def update
    respond_to do |format|
      if @permanence_time.update(permanence_time_params)
        format.html { redirect_to @permanence_time, notice: 'Permanence time was successfully updated.' }
        format.json { render :show, status: :ok, location: @permanence_time }
      else
        format.html { render :edit }
        format.json { render json: @permanence_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permanence_times/1
  # DELETE /permanence_times/1.json
  def destroy
    @permanence_time.destroy
    respond_to do |format|
      format.html { redirect_to permanence_times_url, notice: 'Permanence time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permanence_time
      @permanence_time = PermanenceTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permanence_time_params
      params.require(:permanence_time).permit(:task_id, :system_example_id, :file_example_id, :user_id, :seconds)
    end
end
