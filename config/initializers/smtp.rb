file = Rails.root.join('config', 'smtp.yml')

Rails.application.config.action_mailer.smtp_settings = YAML.load_file(file) if File.exist?(file)
