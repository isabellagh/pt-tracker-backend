class Api::V1::WorkoutsController < ApplicationController
    
  before_action :set_client
    
  def index 
    # if workouts
    #   workouts = client.workouts
    # else
    #   workouts = Workout.all
    # end 
    @workouts = Workout.all
      render json: ClientSerializer.new(@workouts)
  end

  def create 
    # @workout = Workout.new(workout_params)
    @workout = @client.workouts.new(workout_params)
    @workout.date = DateTime.now
    
    if @workout.save
      render json: ClientSerializer.new(@workout), status: :created
    else
      render json: {"Couldnt create workout"}
    end
  end

  def show
    @workout = Workout.find_by_id(params[:id])
    render json: @workout
  end

  # def destroy
  #   @workout = Workout.find_by_id(params[:id])
  #   @workout.destroy
  # end
    
  private

  def set_client
    @client = Client.find_by_id(params[:client_id])
  end

  def workout_params
    params.require(:workout).permit(:workout_date, :reps, :sets, :exercise, :weight, :note, :user_id, :client_id)
  end
end
