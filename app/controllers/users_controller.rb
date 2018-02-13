class UsersController < ApplicationController
    def index
        render json: User.all
    end
    
    def new_user
        render "form"
    end
    
    def total
        a = User.all
        @count = 0
        a.each do |e|
            @count += 1
        end
        render "total"
    end
    
    def user_show
        a = User.find(params[:id])
        @name = a.name
        @id = a.id
        render "users_info"
    end

    def user_edit
        @name = User.find(params[:id]).name
        render "edit"
    end

    def user_process
        User.create(name: params[:name])
        redirect_to "/users"
    end

end
