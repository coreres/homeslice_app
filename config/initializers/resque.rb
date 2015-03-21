Resque.configure do |config|
ENV["REDISTOGO_URL"] ||= "redis://username:password@host:1234/"
uri = URI.parse(ENV["REDISTOGO_URL"])

Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
require 'resque_scheduler'

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }

Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")

# Resque tasks
require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
  task :setup do
    require 'resque'

    # you probably already have this somewhere
    # Resque.redis = 'localhost:6379'
  end

  task :setup_schedule => :setup do
    require 'resque-scheduler'

    # If you want to be able to dynamically change the schedule,
    # uncomment this line.  A dynamic schedule can be updated via the
    # Resque::Scheduler.set_schedule (and remove_schedule) methods.
    # When dynamic is set to true, the scheduler process looks for
    # schedule changes and applies them on the fly.
    # Note: This feature is only available in >=2.0.0.
    # Resque::Scheduler.dynamic = true

    # The schedule doesn't need to be stored in a YAML, it just needs to
    # be a hash.  YAML is usually the easiest.
    Resque.schedule = YAML.load_file('your_resque_schedule.yml')

    # If your schedule already has +queue+ set for each job, you don't
    # need to require your jobs.  This can be an advantage since it's
    # less code that resque-scheduler needs to know about. But in a small
    # project, it's usually easier to just include you job classes here.
    # So, something like this:
    require 'jobs'
  end

  task :scheduler_setup => :setup_schedule
end

  end