class TodosectionsController < ApplicationController
  def new
    @todosection = Todosection.new
  end

  def create
    @todosection = Todosection.new(todosection_params)
    @todosection.user_id = current_user.id
    if @todosection.save
      redirect_to todosections_path
    else
      @error=t("Title can't be blank")
      render 'new'
    end
  end
  
  def show
    @todosection = Todosection.find(params[:id])
    @todopage = Todopage.where(todosection_id: @todosection.id)
    @todopage.sort! { |a,b| a.title.downcase <=> b.title.downcase }
  end


  def index
    @todosection = Todosection.new
    @todosections = Todosection.where(user_id: current_user.id)
  end

  def edit
    @todosection = Todosection.find(params[:id])
  end

  def update
    @todosection = Todosection.find(params[:id])
    if @todosection.update(todosection_params)
      redirect_to todosections_path
    else
      @error=t("Title can't be blank")
      render 'edit'
    end
  end

  def destroy
    @todosection = Todosection.find(params[:id])
    @todosection.destroy
    redirect_to todosections_path
  end

  private
    def todosection_params
      params.require(:todosection).permit(:title)
    end
end
