class ContactsController < ApplicationController
  def home
    render "home.html.erb"
  end
  def index
    @contacts = Contact.all.sort_by {|a| a.last_name}
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    Contact.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number])
    render "create.html.erb"
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
    contact.first_name = params[:first_name]
    contact.last_name = params[:last_name]
    contact.email = params[:email]
    contact.phone_number = params[:phone_number]
    contact.save
    render "update.html.erb"
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    render "destroy.html.erb"
  end
end
