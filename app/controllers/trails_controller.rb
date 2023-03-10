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
    the_trail.length = params.fetch("query_length")
    the_trail.duration = params.fetch("query_duration")
    the_trail.difficulty = params.fetch("query_difficulty")
    the_trail.photos_count = 0
    the_trail.comments_count = 0
    the_trail.bookmarks_count = 0
    the_trail.likes_count = 0

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
    the_trail.length = params.fetch("query_length")
    the_trail.duration = params.fetch("query_duration")

    the_trail.difficulty = params.fetch("query_difficulty")


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
