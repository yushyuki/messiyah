module PostsHelper
  def profile_image_for(post, size = '300')
    image_tag "/docs/#{post.image}", size: size, class: :gravatar
  end
  def profile_image2_for(post, size = '300')
    image_tag "/docs/#{post.image2}", size: size, class: :gravatar
  end
  def profile_image3_for(post, size = '300')
    image_tag "/docs/#{post.image3}", size: size, class: :gravatar
  end
  def profile_image4_for(post, size = '300')
    image_tag "/docs/#{post.image4}", size: size, class: :gravatar
  end
  def profile_image5_for(post, size = '300')
    image_tag "/docs/#{post.image5}", size: size, class: :gravatar
  end

end
