var ready;
ready = function() {
  $('.nav-tabs a:first').addClass('show');
  $('.nav-tabs a:first').tab('show');
  $('.nav-tabs a').click(function(e){
    e.preventDefault();
    $(this).tab('show');
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);

//in rails 5:
//$(document).on('turbolinks:load', function(){
// ...
//});
