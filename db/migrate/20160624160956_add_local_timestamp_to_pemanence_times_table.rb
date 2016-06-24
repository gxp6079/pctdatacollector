class AddLocalTimestampToPemanenceTimesTable < ActiveRecord::Migration
  def change
    add_column :permanence_times, :local_timestamp, :datetime
  end
end
