class SearchController < ApplicationController
  def search
    @model = params["model"]
    @method = params["method"]
    @content = params["content"]
    @records = search_for(@model,@content, @method)
  end

  private
    def search_for(model, content, method)
      if model == 'user'
        if method == 'match'
          User.where(name: content)
        elsif method == 'forward'
          User.where('name LIKE ?', "#{content}%")
        elsif method == 'backward'
          User.where('name LIKE ?', "%#{content}")
        else
          User.where('name LIKE ?', "%#{content}%")
        end

      elsif model == "book"
        if method == 'match'
          Book.where(title: content)
        elsif method == "forward"
          Book.where('name LIKE ?', "#{content}%")
        elsif method == "backward"
          Book.where('name LIKE ?', "%#{content}")
        else
          Book.where('name LIKE ?', "%#{content}%")
        end
      end
    end
end
