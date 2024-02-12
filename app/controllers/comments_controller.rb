class CommentsController < ApplicationController
  def create_comment
    @new_comment = Comment.new
    @new_comment.photo_id = params.fetch("input_photo_id")
    @new_comment.author_id = params.fetch("input_author_id")
    @new_comment.body = params.fetch("input_comment")

    if @new_comment.valid?
      @new_comment.save
      redirect_to("/photos/#{params.fetch("input_photo_id")}", { :notice => "Comment created succesfully." })
    else
      redirect_to("/photos/#{params.fetch("input_photo_id")}", { :notice => "Comment failed to be created." })
    end
  end
end
