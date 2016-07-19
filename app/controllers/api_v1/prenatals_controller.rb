class ApiV1::PrenatalsController < ApplicationController

  def index
    @prenatals = Prenatal.all
  end

  def create
    @prenatal = Prenatal.new( prenatal_params )

    if @prenatal.save
      render :json => { :message => "Successfully created"}
    else
      render :json => { :message => "Validate failed" }, :status => 400
    end
  end

  def create
    @prenatal = Prenatal.update( prenatal_params )

    if @prenatal.save
      render :json => { :message => "Successfully updated"}
    else
      render :json => { :message => "Validate failed" }, :status => 400
    end
  end

  def prenatal_params
    params.require(:prenatal).permit(:title, :content, :message, :status, :count)
  end
end
