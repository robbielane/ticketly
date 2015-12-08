$(document).ready(function() {

  var $vendors = $('.vendor');

  $('#vendor_filter_status').on('change', function () {
    var currentStatus = this.value;
    $vendors.each(function (index, vendor) {
      $vendor = $(vendor);
      if ($vendor.data('status') === currentStatus) {
        $vendor.show();
      } else {
        $vendor.hide();
      }
    });
  });
});
