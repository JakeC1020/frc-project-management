$(document).ready(function(){
  $(".un-checked").on("click", function(event){
    $(this).removeClass("fa-square-o un-checked").addClass("fa-check-square-o checked")
    var id = $(this).attr("id");
    $.ajax({
      url: '/todos/'+id+'/',
      type: 'PUT',
      data: {"todo" : {"done": true}}
    });
  });

  $(".checked").on("click", function(event){
    $(this).removeClass("fa-check-square-o checked").addClass("fa-square-o un-checked")
    var id = $(this).attr("id");
    $.ajax({
      url: '/todos/'+id+'/',
      type: 'PUT',
      data: {"todo" : {"done": false}}
    });
  });
});
