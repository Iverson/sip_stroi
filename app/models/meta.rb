class Meta < ActiveRecord::Base
  belongs_to :metable, polymorphic: true
end
