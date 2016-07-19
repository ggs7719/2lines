class ApiV1::QuestsController < ApiController
  def index
    @quests = Quest.all
  end

    def create
    @quest = Quest.new( quest_params )

    if @quest.save
      render :json => { :message => "Successfully created"}
    else
      render :json => { :message => "Validate failed" }, :status => 400
    end
  end

  def update
    @quest = Quest.find( params[:id])

    if @quest.update( quest_params )
      render :json => { :message => "Successfully updated"}
    else
      render :json => { :message => "Validate failed" }, :status => 400
    end
  end

  def quest_params
    params.permit(:title, :content, :message)
  end
end
