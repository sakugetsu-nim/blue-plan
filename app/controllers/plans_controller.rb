class PlansController < ApplicationController
    def index
    @plans = Plan.all
    end

    def calendar
    @plans = Plan.all
    end

    def new
    @plans = Plan.new
    end

    def create
    @plans = Plan.new(params[:plan])
    @plans.save
    end

    # private
    # def plan_params
    #     params.require(:plan).permit(:title, :content, :start_time)
    # end
end
