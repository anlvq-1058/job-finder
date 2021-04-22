export function showPreviewImage() {
  $('.chose-img').change(function () {
    $('.select-avatar > img').attr("src", URL.createObjectURL(this.files[0]));
  });
}

export function fadeout_error() {
  window.setTimeout(function(){
    $('#error_explanation').addClass('fadeout');
  }, 10000);
}
