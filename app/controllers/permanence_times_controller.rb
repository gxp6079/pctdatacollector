class PermanenceTimesController < ApplicationController

  load_and_authorize_resource

  before_action :set_permanence_time, only: [:show, :edit, :update, :destroy]

  # GET /permanence_times
  # GET /permanence_times.json
  def index
    @permanence_times = PermanenceTime.accessible_by(current_ability).paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
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
    # Don't use AR for performance reasons
    server_timestamp = DateTime.now.strftime('%Y-%m-%d %H:%M:%S.%3N')
    PermanenceTime.connection.execute "INSERT INTO permanence_times (task_id, system_example_id, file_example_id, user_id, seconds, created_at, updated_at, local_timestamp) " +
                               "VALUES (#{permanence_time_params['task_id']}, #{permanence_time_params['system_example_id']}, #{permanence_time_params['file_example_id']}, " +
                               "#{permanence_time_params['user_id']}, #{permanence_time_params['seconds']}, '#{server_timestamp}', '#{server_timestamp}','#{permanence_time_params['local_timestamp']}')"
    render :text => ""
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
      params.require(:permanence_time).permit(:task_id, :system_example_id, :file_example_id, :user_id, :seconds, :local_timestamp)
    end
end
