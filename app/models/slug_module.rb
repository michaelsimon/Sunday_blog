module SlugModule

  module InstanceMethods

    def slug
        self.name.downcase.gsub!(" ", "-")
      end

  end

  module ClassMethods

      def find_by_slug(name)
        self.all.find{|user| user.slug == name}
      end
  end

end 


