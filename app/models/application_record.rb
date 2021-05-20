class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def index_splitter(artists)
    artist_counter = 0
    row_counter = 0
    col1 = []
    col2 = []
    col3 = []
    while artist_counter < artists.count
        artists.each do |art|
            if row_counter == 0
                col1 << art
                row_counter += 1
            elsif row_counter == 1
                col2 << art
                row_counter += 1
            elsif row_counter == 2
                col3 << art
                row_counter = 0
            end
            art_counter += 1
        end
    end
    columns = [col1, col2, col3]
    columns
  end

end
