namespace :test do
  task prepare: :environment do

  site = Comfy::Cms::Site.find_by(label: 'PainGain')
  if site.nil?
    site = Comfy::Cms::Site.create!(
      label: 'PainGain',
      identifier: 'paingain',
      hostname: 'localhost',
      path: '/',
      locale: 'en',
      is_mirrored: false
      )
  end

    ENV['FROM'] = 'paingain'
    ENV['TO']   = 'paingain'
    Rake::Task['comfortable_mexican_sofa:fixtures:import'].invoke
  end
end
