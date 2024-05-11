class PlansController < ApplicationController
    def index
        @plans = Plan.all
        @plan = Plan.new
    end

    def calendar
        @plans = Plan.all
    end
    

    def new
        @plan = Plan.new
    end

    def create
        @plan = Plan.new(plan_params)
    
        if @plan.save
        redirect_to plans_calendar_path, notice: "予定を登録しました"
        else
        flash.now[:alert] = @plan.errors.full_messages.join(', ')
        render :new
        end
    end

    
    def show
        @plan = Plan.find(params[:id])
        
    end

    def destroy
        @plan = Plan.find(params[:id])
        @plan.destroy
        redirect_to plans_path, notice: "削除しました"
    end
      
      
    private
    def plan_params
        params.require(:plan).permit(:title, :content, :start_time, :user_id)
    end
end