json.array!(@iterations) do |iteration|
  json.extract! iteration, :id, :date, :points_completed, :sprint_id
  json.url iteration_url(iteration, format: :json)
end
