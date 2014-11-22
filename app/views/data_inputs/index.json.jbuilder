json.array!(@data_inputs) do |data_input|
  json.extract! data_input, :id, :name
  json.url data_input_url(data_input, format: :json)
end
