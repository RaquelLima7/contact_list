class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]

  # GET /contacts
  def index
    # @contacts = Contact.all
    # authorize_contact
    @contacts = policy_scope(Contact).where(user_id: current_user.id)
  end

  # GET /contacts/1
  def show
    authorize_contact
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    skip_authorization
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    skip_authorization

    if @contact.save
      redirect_to contact_url(@contact), notice: "Contact was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      redirect_to contact_url(@contact), notice: "Contact was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: "Contact was successfully destroyed."
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
    authorize_contact
  end

  def contact_params
    params.require(:contact).permit(:full_name, :document_number, :email, :birthday)
  end

  def authorize_contact
    # byebug
    # policy(@contact).show?
    authorize @contact
  end
end
