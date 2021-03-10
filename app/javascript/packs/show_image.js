export function showPreviewImage() {
  $('.chose-img').change(function () {
    $('.select-avatar > img').attr("src", URL.createObjectURL(this.files[0]));
  });
}
