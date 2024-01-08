json.extract! comment, :id, :content, :post_id, :created_at, :updated_at
json.url topic_post_comment_url(comment, format: :json)
