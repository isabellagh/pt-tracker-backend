class Api::V1::WorkoutsController < ApplicationController
    # before_action :set_workout
    
  def index 
    # if workouts
    #   workouts = client.workouts
    # else
    #   workouts = Workout.all
    # end 
    workouts = Workout.all
      render json: workouts
  end

  def create 
    # workout = Workout.new(workout_params)
    # if workout.save
    #   render 
    # else
    #   render json: {"Couldnt create workout"}
    # end
  end

  def show
    workout = Workout.find_by_id(params[:id])
    render json: workout
  end

  def destroy
    workout = Workout.find_by_id(params[:id])
    workout.destroy
  end
    
  private

  # def set_workout
  #   workout = Workout.find_by_id(params[:client_id])
  # end

  def workout_params
    params.require(:workout).permit(:workout_date, :reps, :sets, :exercise, :weight, :note, :user_id, :client_id)
  end
end
