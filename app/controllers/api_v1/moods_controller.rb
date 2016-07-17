class ApiV1::MoodsController < ApplicationController
  def index
    @quests = Quest.all
  end
end
