class FileExamplesController < ApplicationController

  load_and_authorize_resource
  before_action :set_file_example, only: [:show, :edit, :update, :destroy]

  # GET /file_examples
  # GET /file_examples.json
  def index
    @file_examples = FileExample.order("system_example_id, substring(name, '.+\.(.+)$'), name")
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

  def read_file
    uploaded_file = params[:file]

    if uploaded_file.nil?
      respond_to do |format|
        format.html { redirect_to :back, notice: 'Invalid file.' }
        format.json { head :no_content }
      end
      return
    end

    file_content = uploaded_file.read

    system_example_id = params[:file_example][:system_example_id]
    file_extension = File.extname(uploaded_file.original_filename)

    if  SystemExample.where(id: system_example_id).size <= 0
      respond_to do |format|
        format.html { redirect_to :back, notice: "Invalid system example."}
        format.json { head :no_content }
      end
      return
    end

    if !FileExample.known_file_extensions.include? file_extension
      respond_to do |format|
        format.html { redirect_to :back, notice: "Invalid file extension: #{file_extension}, only " + FileExample.known_file_extensions.join(", ") + "."}
        format.json { head :no_content }
      end
      return
    end

    file_examples = []

    parse_file_example(file_content).each do |filename, code|
      filename = filename.underscore if(file_extension == '.k')
      file_examples.push FileExample.new(system_example_id: system_example_id, name: filename + file_extension, code: code.strip)
    end

    files_are_valid = true
    file_examples.each do |file_example|
      files_are_valid &= file_example.valid?
      if file_example.invalid?
        @file_example = file_example
        break
      end
    end

    if files_are_valid
      file_examples.each do |file_example|
        file_example.save
      end
    end

    respond_to do |format|
      if files_are_valid
        format.html { redirect_to file_examples_url, notice: 'Files examples were successfully created from uploaded file.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @file_example.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def parse_file_example file
      cbraces = 0
      construct_definition = "" # could be a class, interface, context, enacment block
      file_examples = {}
      file_name = ""

      file.each_line do |line|
        striped_line = line.strip()
        next if(striped_line =~ /(import|\*|\/\*)/) == 0 || line == "\n"

        if cbraces == 0
          if striped_line == "{" then
            file_name = "main"
          else
            file_name = striped_line.scan(/(class|interface|context)\s+(\w+).*{/).last[1]
          end
        end

        cbraces += line.count("{")
        construct_definition += line
        cbraces -= line.count("}")
        if cbraces == 0
          file_examples[file_name] = construct_definition
          construct_definition = ""
        end
      end

      file_examples
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_file_example
      @file_example = FileExample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_example_params
      params.require(:file_example).permit(:system_example_id, :name, :code)
    end
end
