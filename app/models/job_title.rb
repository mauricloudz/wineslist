class JobTitle < ApplicationRecord
    def to_s
        return self.name
    end
end
