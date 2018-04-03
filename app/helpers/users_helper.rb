module UsersHelper
    def gravatar_for(user, options = { size: 80 })
        # gravatar是让用户上传头像的
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url="https://www.gravatar.com/avatar/", alt: user.name, class: "gravatar") 
    end
end
