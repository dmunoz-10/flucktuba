# frozen_string_literal: true

# Application Helper
module ApplicationHelper
  def select_options(options, text)
    options.prepend [text, nil]
  end
end
