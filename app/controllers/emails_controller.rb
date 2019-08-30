require 'faker'
class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end
  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html {redirect_to email_path(@email)}
      format.js {}
    end
  end
  def create
    @email = Email.create(object: Faker::Lorem.word, body: Faker::ChuckNorris.fact)
    respond_to do |format|
      format.html { redirect_to root_path}
      format.js {}
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.delete
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  private
  def emails_params
    params.require(:email).permit(:id, :object, :body)
  end
end
