json.extract! task, :id, :label, :user_id
json.due_at task.due_at.to_i
json.finished_at task.finished_at.to_i
