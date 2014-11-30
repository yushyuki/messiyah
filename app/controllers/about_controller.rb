class AboutController < ApplicationController
  def index
    @posts=Post.all
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.json({content: post.content})
    end
  end
end