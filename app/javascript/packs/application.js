// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import '../stylesheets/application'
import 'controllers'
import {
  getMetaValue,
} from 'helpers'
import Rails from '@rails/ujs'

window.Rails = Rails
if (Rails.fire(document, 'rails:attachBidings')) {
  Rails.start()
}

require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

$(document).on('turbolinks:load', function() {
  $('.navbar-burger').click(function() {
    $('.navbar-burger').toggleClass('is-active')
    $('.navbar-menu').toggleClass('is-active')
  })

  function change_theme_local_storage() {
    const theme = localStorage.getItem('theme')
    if (theme == 'dark') {
      $('body').removeClass('light').addClass('dark')
    } else {
      $('body').addClass('light').removeClass('dark')
    }
  }

  if (getMetaValue('is_user') == '0' && localStorage.getItem('theme') == 'dark') {
    $('#switchDarkMode').prop('checked', true);
    change_theme_local_storage()
  }

  $('#switchDarkMode').click(function () {
    if($(this).is(':checked')) {
      localStorage.setItem('theme', 'dark')
    } else {
      localStorage.setItem('theme', 'light')
    }
    change_theme_local_storage()
  })

  $('.file-input').change(function () {
    const file_name_id = $(this).attr('file_name_id')

    if ($(this).get(0).files.length === 1) {
      const file_name = $(this).get(0).files[0].name
      $(`#${file_name_id}`).text(file_name).attr('title', file_name)
    } else {
      $(`#${file_name_id}`).text('No file uploaded').attr('title', '')
    }
  })
})

$(document).on('turbolinks:before-cache', function() {
  $('.navbar-burger').click('destroy')
})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
