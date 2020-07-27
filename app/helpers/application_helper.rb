module ApplicationHelper
    def avatar_url(user)
        if user.avatar.attached?
            url_for(user.avatar)
        # elsif user.image?
        #     user.image
        else
            ActionController::Base.helpers.asset_path('avatar_default.svg')
        end
    end
end
