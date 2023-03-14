# frozen_string_literal: true

module V1
  class StatusController < ApplicationController
    def index
      render json: { status: 'OK' }
    end
end
