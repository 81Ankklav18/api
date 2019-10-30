class Api::V1::GeeksController < ApplicationController
  before_action :set_geek, only: [:show, :update, :destroy]

# для выполнения routes с ассоциацией
  def index
    @geek = Geek.all
    render json: { geeks: @geek }, except: [:id, :created_at, :updated_at]
  end

  def show
    render json: @geek
  end

  def create
    @geek = Geek.new(company_params)
    if @geek.save
      render json: @geek.as_json, status: :created
    else
      render json: {user: @geek.errors, status: :no_content}
    end
  end

  def update
    if @geek.update(company_params)
      render json: @geek
    else
      render json: @geek.errors, status: :unprocessable_entity
    end
  end


  private
  def set_job
    @geek = Geek.find(params[:id])
  end

  def company_params
    params.permit(:name, :stack, :resume)
  end
end
