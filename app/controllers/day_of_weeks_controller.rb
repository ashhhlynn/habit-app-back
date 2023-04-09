class DayOfWeeksController < ApplicationController
    
        def index
            day_of_weeks =  DayOfWeek.all
            render json: day_of_weeks, include: [:checks]
        end
    
        def create
            @day_of_week = DayOfWeek.create(day_of_week_params)
            render json: @day_of_week, status: :created
        end

        def update
            day_of_week = DayOfWeek.find(params[:id])
            if day_of_week.update(day_of_week_params)               
                render json: day_of_week, include: [:habit], status: :ok
            else 
                render json: { message: 'Submission failed. Please try again.' }, status: :unprocessable_entity
            end 
        end 
    
        def destroy
            day_of_week = DayOfWeek.find_by(id: params[:id])
            day_of_week.destroy
            head :no_content, status: :ok
        end
    
        private
    
        def day_of_week_params
            params.require(:day_of_week).permit(:name, :done, :habit_id, checks_attributes: [:day_of_week_id, :complete])
        end
end
