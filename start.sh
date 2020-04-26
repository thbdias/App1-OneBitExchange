# instala as gems
bundle check || bundle install 

#roda o servidor
bundle exec puma -C config/puma.rb