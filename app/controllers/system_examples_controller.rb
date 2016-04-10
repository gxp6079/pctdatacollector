class SystemExamplesController < ApplicationController
  before_action :set_system_example, only: [:show, :edit, :update, :destroy]

  # GET /system_examples
  # GET /system_examples.json
  def index
    @system_examples = SystemExample.all
  end

  # GET /system_examples/1
  # GET /system_examples/1.json
  def show
  end

  # GET /system_examples/new
  def new
    @system_example = SystemExample.new
  end

  # GET /system_examples/1/edit
  def edit
  end

  # POST /system_examples
  # POST /system_examples.json
  def create
    @system_example = SystemExample.new(system_example_params)

    respond_to do |format|
      if @system_example.save
        format.html { redirect_to @system_example, notice: 'System example was successfully created.' }
        format.json { render :show, status: :created, location: @system_example }
      else
        format.html { render :new }
        format.json { render json: @system_example.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /system_examples/1
  # PATCH/PUT /system_examples/1.json
  def update
    respond_to do |format|
      if @system_example.update(system_example_params)
        format.html { redirect_to @system_example, notice: 'System example was successfully updated.' }
        format.json { render :show, status: :ok, location: @system_example }
      else
        format.html { render :edit }
        format.json { render json: @system_example.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system_examples/1
  # DELETE /system_examples/1.json
  def destroy
    @system_example.destroy
    respond_to do |format|
      format.html { redirect_to system_examples_url, notice: 'System example was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system_example
      @system_example = SystemExample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def system_example_params
      params.require(:system_example).permit(:name, :description)
    end
end
