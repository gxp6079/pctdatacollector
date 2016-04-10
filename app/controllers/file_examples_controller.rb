class FileExamplesController < ApplicationController

  load_and_authorize_resource
  before_action :set_file_example, only: [:show, :edit, :update, :destroy]

  # GET /file_examples
  # GET /file_examples.json
  def index
    @file_examples = FileExample.all
  end

  # GET /file_examples/1
  # GET /file_examples/1.json
  def show
  end

  # GET /file_examples/new
  def new
    @file_example = FileExample.new
  end

  # GET /file_examples/1/edit
  def edit
  end

  # POST /file_examples
  # POST /file_examples.json
  def create
    @file_example = FileExample.new(file_example_params)

    respond_to do |format|
      if @file_example.save
        format.html { redirect_to @file_example, notice: 'File example was successfully created.' }
        format.json { render :show, status: :created, location: @file_example }
      else
        format.html { render :new }
        format.json { render json: @file_example.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_examples/1
  # PATCH/PUT /file_examples/1.json
  def update
    respond_to do |format|
      if @file_example.update(file_example_params)
        format.html { redirect_to @file_example, notice: 'File example was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_example }
      else
        format.html { render :edit }
        format.json { render json: @file_example.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_examples/1
  # DELETE /file_examples/1.json
  def destroy
    @file_example.destroy
    respond_to do |format|
      format.html { redirect_to file_examples_url, notice: 'File example was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_example
      @file_example = FileExample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_example_params
      params.require(:file_example).permit(:system_example_id, :name, :code)
    end
end
