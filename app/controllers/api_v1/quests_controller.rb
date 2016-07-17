class ApiV1::QuestsController < ApplicationController
  def index
    @quests = Quest.all
  end
end
