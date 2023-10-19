class ErrorsController < ApplicationController
  def not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  def unprocessable
    render file: "#{Rails.root}/public/422.html", layout: false, status: 422
  end

  def internal_error
    render file: "#{Rails.root}/public/500.html", layout: false, status: 500
  end
end
