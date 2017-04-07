class Point
  module Contract
    class PointForm < ::Reform::Form
      ::Point.attribute_names.each{|col| property col }
      validates :name, presence: true
    end
  end
end
