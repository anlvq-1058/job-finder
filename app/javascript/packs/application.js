// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'select2/dist/css/select2.css';
import 'cocoon';
import "@fortawesome/fontawesome-free/css/all"

window.jQuery = $;
window.$ = $;

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

// ?
require("packs/jquery.magnific-popup.js")
require("packs/show_image.js")
require("@nathanvda/cocoon")
require('select2')

// back end
require("packs/bootstrap-notify.js")
require("packs/material-dashboard.min.js")
require("packs/bootstrap-material-design.min.js")
require("packs/perfect-scrollbar.jquery.min.js")

// front end
require("packs/jquery_min.js")
require("packs/bootstrap.js")
require("packs/jquery.menu-aim.js")
require("packs/jquery.countTo.js")
require("packs/jquery.inview.min.js")
require("packs/owl.carousel.js")
// require("packs/modernizr.js")
require("packs/custom.js")


// custom
document.addEventListener("turbolinks:load", function() {
  $(function () {
      $('[data-toggle="tooltip"]').tooltip()
      $('[data-toggle="popover"]').popover()
  })
})

import { showPreviewImage, fadeout_error } from './show_image';

$(document).on('turbolinks:load', function () {
  $('.js-source-states').select2();
  showPreviewImage();
  fadeout_error();
});

global.toastr = require("toastr")
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
