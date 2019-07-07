class LengthUrl < ApplicationRecord
    class << LengthUrl
        def increase
            length = instance
            length.update(size: length.size+1)
        end

        def size
            instance.size
        end

        private

        def instance
            LengthUrl.first || LengthUrl.create
        end
    end
end
