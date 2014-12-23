# encoding: utf-8
require 'sinatra/base'
require 'pony'

require File.expand_path('../../config/application', __FILE__)

module Application
  class Website < Sinatra::Base
    set :static, true
    set :public_folder, File.expand_path('../../public', __FILE__)

    # Contact form
    post '/mail' do
      template = ERB.new(File.read(File.expand_path('../templates/email.text.erb', __FILE__), :encoding => 'UTF-8'))

      Pony.mail(
        :from     => params[:mail][:email],
        :to       => COMMAND_EMAIL_TO,
        :charset  => 'utf-8',
        :subject  => COMMAND_SUBJECT,
        :body     => template.result(binding),
        :via      => :sendmail
      )

      'ok'
    end
  end
end
