// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'select2/dist/css/select2.css';
import 'cocoon';
import "@fortawesome/fontawesome-free/css/all"

require("@rails/ujs").start()
require("turbolinks").start()
require("bootstrap")
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("packs/owl.carousel.js")
require("packs/custom_2.js")
require("packs/custom_map.js")
require("packs/custom.js")
require("packs/jquery.countTo.js")
require("packs/jquery.magnific-popup.js")
require("packs/jquery.menu-aim.js")
require("packs/jquery.inview.min.js")
require("packs/show_image.js")
require("packs/bootstrap-material-design.min.js")
require("packs/material-dashboard.min.js")
require("packs/perfect-scrollbar.jquery.min.js")
require("packs/bootstrap-notify.js")
require("@nathanvda/cocoon")
require('select2')

window.jQuery = $;
window.$ = $;

document.addEventListener("turbolinks:load", function() {
  $(function () {
      $('[data-toggle="tooltip"]').tooltip()
      $('[data-toggle="popover"]').popover()
  })
})

import { showPreviewImage } from './show_image';

$(document).on('turbolinks:load', function () {
  $('.js-source-states').select2();
  showPreviewImage();
});

global.toastr = require("toastr")
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
