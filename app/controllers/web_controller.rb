class WebController < ApplicationController
  def show
    render file: Rails.root.join("public/app.html"), layout: false
  end
end
