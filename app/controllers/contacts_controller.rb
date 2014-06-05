class ContactsController < ApplicationController
  before_filter :authenticate_user!
	def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
      redirect_to contacts_path
    else
      @error=t("Surname can't be blank")
      render 'new'
    end
  end

  def index
    @contact = Contact.new
    @contacts = Contact.where(user_id: current_user.id)
    @contacts.sort! { |a,b| a.surname.downcase <=> b.surname.downcase }
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contacts_path
    else
      @error=t("Surname can't be blank")
      render 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

    private
    def contact_params
      params.require(:contact).permit(:surname,:name_patronymic, :about, :phone, :address, :fax, :email, :skype, :site)
    end

end
