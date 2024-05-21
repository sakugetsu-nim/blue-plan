class PlansController < ApplicationController
    before_action :authenticate_user! #追加

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

    def edit
        @plan = Plan.find_by(id: params[:id])
    end
      

    def update
        @plan = Plan.find(params[:id])
        if @plan.update(plan_params)
          redirect_to @plan, notice: 'Plan was successfully updated.'
        else
          render :edit
        end
      end
      

    def destroy
        @plan = Plan.find(params[:id])
        @plan.destroy
        redirect_to plans_path, notice: "削除しました"
    end

    
    private
    def plan_params
        params.require(:plan).permit(:user_id, :title, :content, :start_time).merge(user_id: current_user.id)
    end
end