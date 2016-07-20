class PrenatalsController < ApplicationController
  before_action :set_prenatal, only: [:show, :edit, :update, :destroy]

  # GET /prenatals
  # GET /prenatals.json
  def index
    @prenatals = Prenatal.all
  end

  # GET /prenatals/1
  # GET /prenatals/1.json
  def show
    @prenatal = Prenatal.find(params[:id])
  end

  # GET /prenatals/new
  def new
    @prenatal = Prenatal.new
  end

  # GET /prenatals/1/edit
  def edit
    @prenatal = Prenatal.find(params[:id])
  end

  # POST /prenatals
  # POST /prenatals.json
  def create
    @prenatal = Prenatal.new(prenatal_params)

    respond_to do |format|
      if @prenatal.save
        format.html { redirect_to @prenatal, notice: '已新增產檢記錄！' }
        format.json { render :show, status: :created, location: @prenatal }
      else
        format.html { render :new }
        format.json { render json: @prenatal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prenatals/1
  # PATCH/PUT /prenatals/1.json
  def update
    # respond_to do |format|
    @eprenatal = Prenatal.find(params[:id])
      if @prenatal.update(prenatal_params)
      #   format.html { redirect_to prenatals_path, notice: '已更新產檢記錄！' }
      #   format.json { render :show, status: :ok, location: @prenatal }
      # else
      #   format.html { render :edit }
      #   format.json { render json: @prenatal.errors, status: :unprocessable_entity }
       end
       redirect_to prenatals_path
    end

  # DELETE /prenatals/1
  # DELETE /prenatals/1.json
  def destroy
    @prenatal.destroy
    redirect_to prenatals_path
    # respond_to do |format|
    #   format.html { redirect_to prenatals_url, notice: '已刪除產檢記錄！' }
    #   format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prenatal
      @prenatal = Prenatal.find(params[:id])
    end

    def prenatal_params
      params.require(:prenatal).permit(:title, :content, :date, :status)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def prenatal_params
    #   params.fetch(:prenatal, {})
    # end
end