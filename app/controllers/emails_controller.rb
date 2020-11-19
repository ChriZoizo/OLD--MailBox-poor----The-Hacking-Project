class EmailsController < ApplicationController
  def index
    @emails = Email.all
    @email = Email.last
  end

def show
@email = Email.find(params[:id])
@last = Email.last
respond_to do |format|
  format.html { redirect_to root_path }
  format.js { }
end

end

require 'faker'
def create
@email = Email.all
  Email.create!(object: Faker::Lorem.word, body: Faker::Lorem.paragraph)
  respond_to do |format|
    format.html { redirect_to root_path }
    format.js { }
  end
end

def replace
@last = Email.last
end

def update
@email = Email.find(params[:id])
@email.update(status: false)
respond_to do |format|
  format.html { redirect_to root_path }
  format.js { }
end
end


def destroy
@emails = Email.find(params[:id])
@emails.destroy
@last = Email.last
respond_to do |format|
  format.html { redirect_to root_path }
  format.js { }
end
end



private

def email_params
  params.permit(:status)
end


def changestatus 
  email = Email.find(params[:id])
  if email.status == false
    email.update(status: true)
  end
end
end