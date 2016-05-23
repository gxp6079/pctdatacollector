class PreTestAnswersController < ApplicationController

  load_and_authorize_resource
  before_action :set_pre_test_answer, only: [:show, :edit, :update, :destroy]

  # GET /pre_test_answers
  # GET /pre_test_answers.json
  def index
    @pre_test_answers = PreTestAnswer.all.where("pre_test_answers.pre_test_id = ? ", params[:pre_test_id])
  end

  # GET /pre_test_answers/1
  # GET /pre_test_answers/1.json
  def show
  end

  # GET /pre_test_answers/new
  def new
    @pre_test_answer = PreTestAnswer.new
  end

  # GET /pre_test_answers/1/edit
  def edit
  end

  # POST /pre_test_answers
  # POST /pre_test_answers.json
  def create
    @pre_test_answer = PreTestAnswer.new(pre_test_answer_params)

    respond_to do |format|
      if @pre_test_answer.save
        format.html { redirect_to @pre_test_answer, notice: 'Pre test answer was successfully created.' }
        format.json { render :show, status: :created, location: @pre_test_answer }
      else
        format.html { render :new }
        format.json { render json: @pre_test_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pre_test_answers/1
  # PATCH/PUT /pre_test_answers/1.json
  def update
    respond_to do |format|
      if @pre_test_answer.update(pre_test_answer_params)
        format.html { redirect_to @pre_test_answer, notice: 'Pre test answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @pre_test_answer }
      else
        format.html { render :edit }
        format.json { render json: @pre_test_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_test_answers/1
  # DELETE /pre_test_answers/1.json
  def destroy
    @pre_test_answer.destroy
    respond_to do |format|
      format.html { redirect_to pre_test_answers_url, notice: 'Pre test answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_test_answer
      @pre_test_answer = PreTestAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pre_test_answer_params
      params.require(:pre_test_answer).permit(:pre_test_id, :user_id, :answer)
    end
end
