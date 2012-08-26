require 'mongoid'

Mongoid.configure do |config|
  if ENV['MONGOHQ_URL']
    Mongoid.load!(File.join(settings.root, 'mongoid.yml'), :production)
  else
    Mongoid.load!(File.join(settings.root, 'mongoid.yml'), :development)
  end
end
