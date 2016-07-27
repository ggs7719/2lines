class ApiV1::QuestsController < ApiController

  before_action :authenticate_user!

  def index
    @quests = Quest.where( :mother => current_user )
  end

  def create
    @quest = Quest.new( quest_params )
    @quest.mother = current_user

    f = Parent.find_by(:mother => current_user)
    @quest.father = f.father

    if @quest.save
      render :json => { :message => "Successfully created"}
    else
      render :json => { :message => "Validate failed" }, :status => 400
    end
  end

  def destroy
    quest = Quest.find( params[:id] )
    quest.remove = true

    if quest.save
      render :json => { :message => "Successfully deleted",
                        :delete => true }
    else
      render :json => { :message => "Failed" }, :status => 400
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

  def days_ago
    a = params[:days]
    @quests = Quest.where(:mother=> current_user ).where("created_at > ?", a.to_f.days.ago)
  end

  def sec_ago
    b = params[:sec]
    @quests = Quest.where(:mother=> current_user ).where("created_at > ?", b.to_f.seconds.ago)
  end

  def send_read
    quest = Quest.find( params[:id] )
    quest.status = true

    if quest.save
      render :json => { :message => "Already readed",
                        :read_status => true }
    else
      render :json => { :message => "Failed" }, :status => 400
    end
  end

  def send_done
    quest = Quest.find( params[:id] )
    quest.done = true

    if quest.save
      render :json => { :message => "Already done",
                        :done => true }
    else
      render :json => { :message => "Failed" }
    end
  end

  def quest_params
    params.permit(:title, :content, :message, :pic)
  end
end
