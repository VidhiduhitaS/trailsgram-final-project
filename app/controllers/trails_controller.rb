class TrailsController < ApplicationController
  def index
    matching_trails = Trail.all

    @list_of_trails = matching_trails.order({ :created_at => :desc })

    render({ :template => "trails/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_trails = Trail.where({ :id => the_id })

    @the_trail = matching_trails.at(0)

    render({ :template => "trails/show.html.erb" })
  end

  def create
    the_trail = Trail.new
    the_trail.name = params.fetch("query_name")
    the_trail.length = params.fetch("query_length", false)
    the_trail.duration = params.fetch("query_duration")
    the_trail.address = params.fetch("query_address")
    the_trail.difficulty = params.fetch("query_difficulty")
    the_trail.photos_count = params.fetch("query_photos_count")
    the_trail.comments_count = params.fetch("query_comments_count")
    the_trail.bookmarks_count = params.fetch("query_bookmarks_count")
    the_trail.likes_count = params.fetch("query_likes_count")

    if the_trail.valid?
      the_trail.save
      redirect_to("/trails", { :notice => "Trail created successfully." })
    else
      redirect_to("/trails", { :alert => the_trail.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_trail = Trail.where({ :id => the_id }).at(0)

    the_trail.name = params.fetch("query_name")
    the_trail.length = params.fetch("query_length", false)
    the_trail.duration = params.fetch("query_duration")
    the_trail.address = params.fetch("query_address")
    the_trail.difficulty = params.fetch("query_difficulty")
    the_trail.photos_count = params.fetch("query_photos_count")
    the_trail.comments_count = params.fetch("query_comments_count")
    the_trail.bookmarks_count = params.fetch("query_bookmarks_count")
    the_trail.likes_count = params.fetch("query_likes_count")

    if the_trail.valid?
      the_trail.save
      redirect_to("/trails/#{the_trail.id}", { :notice => "Trail updated successfully."} )
    else
      redirect_to("/trails/#{the_trail.id}", { :alert => the_trail.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_trail = Trail.where({ :id => the_id }).at(0)

    the_trail.destroy

    redirect_to("/trails", { :notice => "Trail deleted successfully."} )
  end
end
