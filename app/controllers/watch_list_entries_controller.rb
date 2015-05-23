class WatchListEntriesController < ApplicationController

  def add
    WatchListEntry.where(watch_list_entry_params).first_or_create
  end

private 

  def watch_list_entry_params
    params.permit(:imdb_identifier)
  end

end
