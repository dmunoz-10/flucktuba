# frozen_string_literal: true

# Application Helper
module ApplicationHelper
  def select_options(options, text, choosed)
    new_options = options.prepend [text, nil]
    options_for_select(new_options, choosed)
  end
end
