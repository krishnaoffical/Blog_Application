# frozen_string_literal: true
# app/views/topics/create.json.jbuilder
json.message "Topic was successfully created"
json.topic do
  json.id @topic.id
end
