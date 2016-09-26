require 'csv'
module CsvModelMixin
  extend ActiveSupport::Concern

  # http://api.rubyonrails.org/classes/ActiveSupport/Concern.html
  # see https://richonrails.com/articles/rails-4-code-concerns-in-active-record-models
  #http://stackoverflow.com/questions/7463440/why-do-we-need-classmethods-and-instancemethods

  included do
    # see here -->  http://api.rubyonrails.org/classes/ActiveSupport/Concern.html
  end

  module ClassMethods

    def importCSV(file)
      CSV.foreach(file.path, headers: true) do |row|
        obj = find_by_id(row["id"]) || new
        obj.attributes = row.to_hash.slice(*row.to_hash.keys)
        obj.save!
      end
    end

    def exportCSV(options={})
      CSV.generate(options) do |csv|
        csv << column_names
        self.all.each do |row|
          csv << row.attributes.values_at(*column_names)
        end
      end
    end

  end

  module InstanceMethods
  end

end    