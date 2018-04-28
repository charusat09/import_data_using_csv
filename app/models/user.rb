require "csv"
class User < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      user = find_by_name(row["name"]) || new
      user.attributes = row.to_hash
      user.save!
    end
  end

  def self.filter(name=nil)
    name ? where('name LIKE ?', "%#{name}%") : all
  end
end
