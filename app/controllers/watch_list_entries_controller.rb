class WatchListEntriesController < ApplicationController

  def add
    WatchListEntry.where(watch_list_entry_params).first_or_create
    redirect_to user_path(123)
  end

private 

  def watch_list_entry_params
    params.permit(:imdb_identifier)
  end

end
