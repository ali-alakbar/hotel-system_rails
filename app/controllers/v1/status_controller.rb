class V1::StatusController < ApplicationController
  def index
    render json: { status: 'OK' }
  end
end
