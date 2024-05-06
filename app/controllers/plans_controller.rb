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
        p params
    end    
end
