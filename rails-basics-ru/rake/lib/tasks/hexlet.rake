# frozen_string_literal: true

require 'csv'

namespace :hexlet do
  desc 'Import Users from CV file'
  task :import_users, [:path] => :environment do |_task, args|
    path = args[:path]
    CSV.foreach(path, headers: true) do |row|
      first_name, last_name, birthday, email = row.fields
      month, day, year = birthday.split('/')
      date = Date.parse("#{year}-#{month}-#{day}")
      User.create!(first_name: first_name, last_name: last_name, birthday: date, email: email)
    end
  end
end
