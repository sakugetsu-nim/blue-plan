class BluePlanController < ApplicationController
    include SimpleCalendar
  
    # ログイン画面
    def welcome
    end
  
    # カレンダー表示
    def calendar
      @blue_plans = BluePlan.all
    end
  
    # 新規投稿フォームの表示
    def new
      @blue_plan = BluePlan.new
    end
  
    # 投稿の詳細表示
    def show
      @blue_plan = BluePlan.find(params[:id])
    end
  
    # 投稿一覧の表示
    def index
      @blue_plans = BluePlan.all
    end
  
    # 投稿の削除
    def destroy
      @blue_plan = BluePlan.find(params[:id])
      @blue_plan.destroy
      redirect_to blue_plan_index_path
    end
  end
  