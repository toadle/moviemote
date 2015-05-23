class WatchListEntriesController < ApplicationController

  def add
    WatchListEntry.where(watch_list_entry_params).first_or_create
    redirect_to user_path(current_user)
  end

private

  def watch_list_entry_params
    params.permit(:tmdb_identifier, :user_id)
  end

end
