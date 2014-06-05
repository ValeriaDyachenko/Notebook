class TodopagesController < ApplicationController
  def index
    @todopages = Todopage.where(todosection_id: @todosection.id)
  end
  def show
    @todosection = Todosection.find(params[:todosection_id])
    @todopages = Todopage.where(todosection_id: @todosection.id)
    @todopage = Todopage.find(params[:id])
  end
  def new
    @todosection = Todosection.find(params[:todosection_id])
    @todopage = Todopage.new(todopage_params)
    @todopage.todosection_id = @todosection.id
    render 'new'
  end

  def create
    @todosection = Todosection.find(params[:todosection_id])
    @todopage = Todopage.new(todopage_params)
    @todopage.todosection_id = @todosection.id
    if @todopage.save
      redirect_to @todosection
    else
      @error=t("Title can't be blank")
      render 'new'
    end
  end

  def edit
    @todosection = Todosection.find(params[:todosection_id])
    @todopage = Todopage.find(params[:id])
  end

  def update
    @todosection = Todosection.find(params[:todosection_id])
    @todopage = Todopage.find(params[:id])
    @todopage.update_attributes(todopage_params)
    if @todopage.update(todopage_params)
      redirect_to  @todosection
    else
      @error=t("Title can't be blank")
      render 'edit'
    end
  end
  
  def destroy
    @todosection = Todosection.find(params[:todosection_id])
    @todopage = @todosection.todopages.find(params[:id])
    @todopage.destroy
    redirect_to todosection_path(@todosection)
  end

  private
    def todopage_params
      params.require(:todopage).permit(:title)
    end
end
