class ChecksController < ApplicationController

    def index
        checks =  Check.all
        render json: checks
    end

    def create
        check = Check.create(check_params)
        
    end

    def update
        check = Check.find(params[:id])
        if check.update(check_params)
           
            
            render json: check, status: :ok
        else 
            render json: { message: 'Order submission failed. Please try again.' }, status: :unprocessable_entity
        end 
    end 

    def destroy
        check = Check.find_by(id: params[:id])
        check.destroy
        head :no_content, status: :ok
    end

    private

    def check_params
        params.require(:check).permit(:complete, :day_of_week_id)
    end

end


