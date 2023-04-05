class HabitsController < ApplicationController

    def index
       habits= Habit.all
        render json: habits, include: [day_of_weeks: {include: :checks}]
      end
    
      def create
        @habit = Habit.create(habit_params)
        params[:day_of_weeks].each do |dow|
          DayOfWeek.create(habit_id: @habit.id, name: dow)
        end 
        if @habit.valid?
          render json: @habit, include: [:day_of_weeks], status: :created
        else 
          render json: { message: 'Submission failed. Please try again.' }, status: :unprocessable_entity
        end
      end
    
      def update
        habit = Habit.find(params[:id])
        if habit.update(habit_params)
          render json: habit, include: [:day_of_weeks]
        else 
          render json: { message: 'Failed to update. Please try again.' }, status: :unprocessable_entity
        end 
      end 
    
      def destroy
        habit = Habit.find(params[:id])
       habit.destroy
        head :no_content, status: :ok
      end
    
      private
    
      def habit_params
        params.require(:habit).permit(:title, :startday, :description, :days, :user_id, :day_of_weeks => [:habit_id, :name])
      end
    

end
