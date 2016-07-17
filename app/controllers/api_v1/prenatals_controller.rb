class ApiV1::PrenatalsController < ApplicationController
  def index
    @quests = Quest.all
  end
end
