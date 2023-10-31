class Api::V0::TeasController < ApplicationController
  before_action :set_tea, only: %i[show update destroy]

  # GET /teas
  def index
    @teas = Tea.all
    render json: @teas
  end

  # GET /teas/1
  def show
    render json: @tea
  end

  # POST /teas
  def create
    @tea = Tea.new(tea_params)

    if @tea.save
      render json: @tea, status: :created
    else
      render json: @tea.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teas/1
  def update
    if @tea.update(tea_params)
      render json: @tea
    else
      render json: @tea.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teas/1
  def destroy
    if @tea.destroy
      render json: { message: 'Tea removed successfully' }, status: :ok
    else
      render json: { error: 'Failed to remove tea' }, status: :unprocessable_entity
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_tea
    @tea = Tea.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Tea not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def tea_params
    params.require(:tea).permit(:title, :description, :temperature, :brewtime)
  end
end
