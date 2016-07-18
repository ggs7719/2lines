class ApiV1::PsychosController < ApplicationController
  def index
    @psychos = Psycho.all
  end
end
