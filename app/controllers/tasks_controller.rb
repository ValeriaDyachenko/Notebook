class TasksController < ApplicationController
	def index
    @task = Task.new
    @tasks=Task.where(user_id: current_user.id)
    @utasks = []
    @ftasks = []
    @ttasks = []
    @tasks.each do |t|
      @utasks << t if t.urgency_status=true
      @ftasks << t if t.execution_status=false
      @ttasks << t if t.execution_status=true
    end      
    @tcount = @ttasks.count
    @ucount = @utasks.count
    @fcount = @ftasks.count

    @todopages = Todopage.all
  end

  def create
    @todosection = Todosection.find(params[:todosection_id])
    @todopage = Todopage.find(params[:todopage_id])
    @task = Task.new(task_params)
    @task.execution_status = false
    @task.urgency_status = false
    @task.user_id = current_user.id
    @task.todopage_id = @todopage.id
    tasks = Task.find_all_by_todopage_id(@task.todopage_id)
    if @task.save
      redirect_to @todosection
    else
      @error=t("Title can't be blank")
      render 'new'
    end
  end

  def destroy
    @todosection = Todosection.find(params[:todosection_id])
    @todopage = Todopage.find(params[:todopage_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to @todosection
  end
  
  def show
    @todosection = Todosection.find(params[:todosection_id])
    @todopage = Todopage.find(params[:todopage_id])
    @task = Task.find(params[:id])
  end

  def edit
    @todosection = Todosection.find(params[:todosection_id])
    @todopage = Todopage.find(params[:todopage_id])
    @task = Task.find(params[:id])
  end

  def update
    @todosection = Todosection.find(params[:todosection_id])
    @todopage = Todopage.find(params[:todopage_id])
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
    if @task.update(task_params)
      redirect_to @todosection
    else
      @error=t("Title can't be blank")
      render 'edit'
    end
  end

  def st
    @todosection = Todosection.find(params[:todosection_id])
    @todopage = Todopage.find(params[:todopage_id])
    @task = Task.find(params[:task_id])

    @id = params[:id]
    @task.execution_status = !@task.execution_status
    @task.save
    redirect_to @todosection
  end
  
  def sti



    @todosection = Todosection.find(params[:todosection_id])
    @todopage = Todopage.find(params[:todopage_id])
    @task = Task.find(params[:task_id])
    @task.execution_status = !@task.execution_status
    @task.save
    @tasks=Task.where(user_id: current_user.id)
    @utasks = []
    @ftasks = []
    @ttasks = []
    @tasks.each do |t|
      @utasks << t if t.urgency_status=true
      @ftasks << t if t.execution_status=false
      @ttasks << t if t.execution_status=true
    end      
    @tcount = @ttasks.count
    @ucount = @utasks.count
    @fcount = @ftasks.count
    render "index" 
  end
  def ust
    @todosection = Todosection.find(params[:todosection_id])
    @todopage = Todopage.find(params[:todopage_id])
    @task = Task.find(params[:task_id])
    @task.urgency_status = !@task.urgency_status
    @task.save
    redirect_to @todosection
  end
    def usti
    @todosection = Todosection.find(params[:todosection_id])
    @todopage = Todopage.find(params[:todopage_id])
    @task = Task.find(params[:task_id])
    @task.urgency_status = !@task.urgency_status
    @task.save
    @tasks=Task.where(user_id: current_user.id)
    @utasks = []
    @ftasks = []
    @ttasks = []
    @tasks.each do |t|
      @utasks << t if t.urgency_status=true
      @ftasks << t if t.execution_status=false
      @ttasks << t if t.execution_status=true
    end      
    @tcount = @ttasks.count
    @ucount = @utasks.count
    @fcount = @ftasks.count
    render "index"  
  end

  
  private
    def task_params
      params.require(:task).permit(:execution_status, :title, :description, :urgency_status, :completion_date)
    end
end
