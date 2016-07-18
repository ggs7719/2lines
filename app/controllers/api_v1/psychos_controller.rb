class ApiV1::PsychosController < ApplicationController
  def index
    @Psychos = Psycho.all
  end
end
