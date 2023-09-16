json.extract! post, :id, :name, :content, :date, :topic_id, :created_at, :updated_at
json.url topic_post_url(post, format: :json)
