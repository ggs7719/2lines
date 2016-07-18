class ApiV1::MoodsController < ApplicationController
  def index
    @moods = Mood.all
  end
end
