class StaticPagesController < ApplicationController

  load_and_authorize_resource

  def home
    @static_pages = StaticPage.new("Wellcome")
  end

  def download_tasks
    if current_user.group == ".k"
      filename = "trygve_tasks.docx"
    elsif current_user.group == ".java"
      filename = "java_tasks.docx"
    elsif
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'You are not in a group for the experiment.' }
        format.json { head :no_content }
      end
      return
    end

    training_mode = ""
    training_mode = "training." if(current_user.is_in_training?)

    begin
      send_file(
        "#{Rails.root}/public/task_documents/#{training_mode}#{filename}",
        filename: filename,
        type: "application/docx"
      )
    rescue ActionController::MissingFile => e
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'The answer sheet file is not available.' }
        format.json { head :no_content }
      end
    end

  end
end
