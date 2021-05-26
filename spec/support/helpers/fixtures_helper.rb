# frozen_string_literal: true

module FixturesHelper
  def params_from_json(path, options = {})
    JSON.parse(File.read("spec/fixtures/files/#{path}.json"), { symbolize_names: true }.merge(options))
  end
end
