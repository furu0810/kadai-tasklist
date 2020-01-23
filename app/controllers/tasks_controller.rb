class TasksController < ApplicationController
    def index
        
        @tasks = Task.all
        
    end
    
    def create
        
        @task = Task.new(task_params)
        
            if @task.save
                flash[:success] = "タスクが正常に追加されました"
                redirect_to @task
                
            else 
                flash.now[:danger] = "タスクが正常に投稿されませんでした。"
                render :new
            
            end
        
    end
    
    def new
        
        @task = Task.new(content: "ここにタスク内容を入力")
        
    end
    
    def edit
        
        @task = Task.find(params[:id])
        
    end
    
    def show
        
        @task = Task.find(params[:id])
        
    end
    
    def update
        
        @task = Task.find(params[:id])
        
            if @task.update(task_params)
                flash[:success] = "タスク内容は正常に更新されました"
                redirect_to @task
            
            else
                flash.now[:danger] = "タスク内容は正常に更新されませんでした"
                render :edit
                
            end 
        
    end
    
    def destroy
        
        @task = Task.find(params[:id])
        @task.destroy
        
        flash[:success] = "タスクは正常に削除されました"
        redirect_to task_url
        
    end
    
    private
    
    #Strong parameter
    
    def task_params
        
        params.require(:task).permit(:content)
        
    end
    
    
end