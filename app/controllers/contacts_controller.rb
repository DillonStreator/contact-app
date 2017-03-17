class ContactsController < ApplicationController
  def home
    render "home.html.erb"
  end
  def help
    flash[:notice] = "Contact was successfully updated!"
  end
  def index
    @contacts = Contact.all.sort_by {|a| a.last_name}
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    contact = Contact.new(first_name: params[:first_name].capitalize, last_name: params[:last_name].capitalize, email: params[:email], phone_number: params[:phone_number], middle_name: params[:middle_name], bio: params[:bio])
    contact.save
    flash[:success] = "Contact was successfully created!"
    redirect_to "/contacts/#{contact.id}"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    contact = Contact.find_by(id: params[:id])
    contact.first_name = params[:first_name].capitalize
    contact.middle_name = params[:middle_name].capitalize
    contact.last_name = params[:last_name].capitalize
    contact.email = params[:email]
    contact.phone_number = params[:phone_number]
    contact.bio = params[:bio]
    contact.save
    flash[:success] = "Contact was successfully updated!"
    redirect_to "/contacts/#{contact.id}"
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    flash[:danger] = "Contact was successfully destroyed!"
    redirect_to "/contacts"
  end

  def search
    @search_name = params[:search_name].capitalize
    @contacts = Contact.all
    render "search.html.erb"
  end
end
