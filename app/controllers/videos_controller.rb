class VideosController < ApplicationController
def index 
  @videos = Video.order('created_at DESC')
end

def new
  @video = Video.new
end

def create
  @video = Video.new(video_params)
  if @video.save
    flash[:success]="video added"
    redirect_to root_url
  else
    render :new
  end
end

end

private

def video_params
  params.require(:video).permit(:link)
end