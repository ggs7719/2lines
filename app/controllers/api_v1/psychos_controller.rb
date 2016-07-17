class ApiV1::PsychosController < ApplicationController
  def index
    @quests = Quest.all
  end
end
