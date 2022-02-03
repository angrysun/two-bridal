if @review.persisted?
  json.form json.partial!('reviews/form.html.erb', dress: @dress, review: Review.new)
  json.inserted_item json.partial!('reviews/review.html.erb', review: @review)
else
  json.form json.partial!('reviews/form.html.erb', dress: @dress, review: @review)
end
