// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import '../stylesheets/application'
import 'materialize-css/dist/js/materialize'
import 'controllers'
import {
  getMetaValue,
} from 'helpers'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

$(document).on('turbolinks:load', function() {
  $('.sidenav').sidenav()
  $('select').formSelect();

  const color_theme = getMetaValue('color_theme')
  if (color_theme == 'dark') {
    $('.theme').addClass('dark').removeClass('light')
  } else {
    $('.theme').addClass('light').removeClass('dark')
  }
});

document.addEventListener("turbolinks:before-cache", function() {
  $('.sidenav').sidenav('destroy')
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
