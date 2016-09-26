
class Facility < ActiveRecord::Base

  def self.importCSV(file)
    CSV.foreach(file.path, headers: true) do |row|
      obj = find_by_id(row["id"]) || new
      obj.attributes = row.to_hash
      obj.save!
    end
  end

  def self.exportCSV(options={})
    CSV.generate(options) do |csv|
      csv << column_names
      self.all.each do |row|
        # use values_at and splat of column_names to assure order matches header
        # as opposed to just using row.attributes.values which would not guarantee order matching header row and data rows in output
        csv << row.attributes.values_at(*column_names)
      end
    end
  end

  has_many :product

end
