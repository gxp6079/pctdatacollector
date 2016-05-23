class PreTestsController < ApplicationController
  before_action :set_pre_test, only: [:show, :edit, :update, :destroy]

  # GET /pre_tests
  # GET /pre_tests.json
  def index
    @pre_tests = PreTest.all
  end

  # GET /pre_tests/1
  # GET /pre_tests/1.json
  def show
  end

  # GET /pre_tests/new
  def new
    @pre_test = PreTest.new
  end

  # GET /pre_tests/1/edit
  def edit
  end

  # POST /pre_tests
  # POST /pre_tests.json
  def create
    @pre_test = PreTest.new(pre_test_params)

    respond_to do |format|
      if @pre_test.save
        format.html { redirect_to @pre_test, notice: 'Pre test was successfully created.' }
        format.json { render :show, status: :created, location: @pre_test }
      else
        format.html { render :new }
        format.json { render json: @pre_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pre_tests/1
  # PATCH/PUT /pre_tests/1.json
  def update
    respond_to do |format|
      if @pre_test.update(pre_test_params)
        format.html { redirect_to @pre_test, notice: 'Pre test was successfully updated.' }
        format.json { render :show, status: :ok, location: @pre_test }
      else
        format.html { render :edit }
        format.json { render json: @pre_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_tests/1
  # DELETE /pre_tests/1.json
  def destroy
    @pre_test.destroy
    respond_to do |format|
      format.html { redirect_to pre_tests_url, notice: 'Pre test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_test
      @pre_test = PreTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pre_test_params
      params.require(:pre_test).permit(:description, :html_test, :correct_answer, :group)
    end
end
