class SessionsController < ApplicationController 

    def new 
    end   
    
    def create
        user_info = request.env['omniauth.auth']
        if user_info['credentials']['token'].present?
            @user = User.find_or_create_by(uid: user_info['uid'])
            update_user(user_info)
            set_session(@user)
            redirect_to '/courses'
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private
    def set_session(user)
        session[:user_id] = user.id
    end

    def update_user(user_info)
        @user.username = user_info[:info]['email']
        @user.uid = user_info['uid']
        @user.token = user_info['credentials']['token']
        @user.save
    end 

end 