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
            redirect_to "/plans/calendar", notice: "予定を登録しました"

        else
        flash.now[:alert] = @plan.errors.full_messages.join(', ')
        render :new
        end
    end

    
    def show
        @plan = Plan.find_by(id: params[:id])
        if @plan
        # レコードが見つかった場合の処理
        render :show
        else
        # レコードが見つからなかった場合の処理
        redirect_to root_path, alert: "指定された予定は見つかりませんでした。"
        end
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