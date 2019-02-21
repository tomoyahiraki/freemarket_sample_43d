$(function(){
  $('.image__upload__imagebox-ul-one').css('display', 'none');
  // $('.image__upload__imagebox-ul-two').css('display', 'none');
  // $('.image__upload__imagebox-ul-three').css('display', 'none');
  // $('.image__upload__imagebox-ul-four').css('display', 'none');

  // $('.content-update__container-uploadbox-2').css('display', 'none');

  $('#image_upload').change(function(e){
    var file = e.target.files[0];
    var reader = new FileReader();

    reader.onload = (function(file){
      return function(e){
        $('.image__upload__imagebox-ul-one').show();
        $('.image__upload__imagebox-ul-one').css('display', 'inline-block');
        // $('.content-update__container-uploadbox-2').show();
        $('.content-update__container-uploadbox').css('width', '80%');
        $('.content-update__container-uploadbox').css('float', 'right');
        // $('.content-update__container-uploadbox').css('display', 'none');
        $('.image__upload__imagebox-container-1').attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);
  });
});
