module ApplicationHelper

  def add_to_watch_list_button(imdb_identifier)
    render 'shared/add_to_watch_list', imdb_identifier: imdb_identifier
  end
end
