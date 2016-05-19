class VideoObserver < ActiveRecord::Observer
  def before_save(resource)
    video = Yt::Video.new url: resource.link
    resource.uid = video.id
    resource.title = video.title

    resource.comment_count = video.comment_count
    resource.comments = video.comments since: 10.weeks.ago, until: 1.week.ago, by: :day
    
    resource.likes = video.like_count
    resource.dislikes = video.dislike_count
    resource.published_at = video.published_at
   rescue Yt::Errors::NoItems
     resource.title = '' 
   end
end
