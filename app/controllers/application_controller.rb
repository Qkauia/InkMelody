class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  #負責宣染404頁面
  def not_found
    render file: Rails.public_path.join('404.html'), status: 404, layout: false
  end
  
  
end
