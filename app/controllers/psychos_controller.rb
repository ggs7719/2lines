class PsychosController < ApplicationController
  before_action :set_psycho, only: [:show, :edit, :update, :destroy]

  # GET /psychos
  # GET /psychos.json
  def index
    @psychos = Psycho.all
  end

  # GET /psychos/1
  # GET /psychos/1.json
  def show
  end

  # GET /psychos/new
  def new
    @psycho = Psycho.new
  end

  # GET /psychos/1/edit
  def edit
  end

  # POST /psychos
  # POST /psychos.json
  def create
    @psycho = Psycho.new(psycho_params)

    respond_to do |format|
      if @psycho.save
        format.html { redirect_to @psycho, notice: 'Psycho was successfully created.' }
        format.json { render :show, status: :created, location: @psycho }
      else
        format.html { render :new }
        format.json { render json: @psycho.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /psychos/1
  # PATCH/PUT /psychos/1.json
  def update
    respond_to do |format|
      if @psycho.update(psycho_params)
        format.html { redirect_to @psycho, notice: 'Psycho was successfully updated.' }
        format.json { render :show, status: :ok, location: @psycho }
      else
        format.html { render :edit }
        format.json { render json: @psycho.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /psychos/1
  # DELETE /psychos/1.json
  def destroy
    @psycho.destroy
    respond_to do |format|
      format.html { redirect_to psychos_url, notice: 'Psycho was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_psycho
      @psycho = Psycho.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def psycho_params
      params.fetch(:psycho, {})
    end
end
