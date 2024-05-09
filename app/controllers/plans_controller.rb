class PlansController < ApplicationController
    def index
        @plans = Plan.all
    end

    def calendar
        @plans = Plan.where(calendar_id: params[:id]) # 'calendar' に関連する予定を取得する
    end

    def new
        @plan = Plan.new
    end

    def create
        @plan = Plan.new(plan_params)
        if @plan.save
            redirect_to @plan, notice: "予定を登録しました"
        else
            flash.now[:alert] = "予定の登録に失敗しました"
            render 'new'
        end
    end
    

    def show
        if params[:id] == "calendar"
          # 特定の条件でリダイレクト
          redirect_to calendar_path
        else
          # 数値の場合にプランをロード
          @plan = Plan.find(params[:id])
        end
      end
      
      

    private
    def plan_params
        params.require(:plan).permit(:title, :body, :start_time, :user_id)
    end
end
