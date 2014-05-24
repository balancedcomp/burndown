json.array!(@sprints) do |sprint|
  json.extract! sprint, :id, :title, :total_points, :start_date
  json.url sprint_url(sprint, format: :json)
end
