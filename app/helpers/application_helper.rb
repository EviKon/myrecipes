module ApplicationHelper
  def gravatar_for(user, option = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = option[:size]
    gravatar_url = "https://secure.gravat.com/avatar#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: @chef, class: "img-circle")
  end
end
