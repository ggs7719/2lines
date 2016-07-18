class ApiV1::PrenatalsController < ApplicationController
  def index
    @prenatals = Prenatal.all
  end
end
