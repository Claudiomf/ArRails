# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ArRails::Application.initialize!

# Paginacao
require "will_paginate"

# Desta forma, no iniciar do seu aplicativo, você está passando a string do locale corrente 
# ( no caso o arquivo pt-BR.yml ) que corresponde a “pagination” para os valores padrão 
# do hash pagination_options que o will_paginate usa.
WillPaginate::ViewHelpers.pagination_options[:previous_label]=I18n.t("pagination.prev")
WillPaginate::ViewHelpers.pagination_options[:next_label]=I18n.t("pagination.next")