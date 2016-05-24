class VideoObserver < ActiveRecord::Observer

  def before_save(resource)
   
    video = Yt::Video.new url: resource.link
 
    resource.uid = video.id
    resource.title = video.title

    resource.comment_count = video.comment_count
    resource.comments = video.comment_threads.take(3).map{ |v| [ "author_display_name": v.author_display_name, "like_count": v.like_count, "total_reply_count": v.total_reply_count, "text_display": v.text_display]}
     
    resource.likes = video.like_count
    resource.dislikes = video.dislike_count
    resource.published_at = video.published_at
   rescue Yt::Errors::NoItems
     resource.title = '' 
   end
end
