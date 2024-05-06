class PlansController < ApplicationController

    def index
        @plans = Plan.all
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
            redirect_to @plan 
        else
            render 'new'
        end
    end

    def show
        @plan = Plan.find(params[:id])
    end

    private
    def plan_params
        params.require(:plan).permit(:title, :body, :start_time)
    end
end
