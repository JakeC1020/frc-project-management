$(document).on('ready', function() {
  
  var markDone = function(id, done) {
    $.ajax({
      url: '/todos/' + id + '/',
      type: 'PUT',
      data: {'todo': {'done': done}}
    });
  };
  
  $(document).delegate('.checked', 'click', function(e) {
    console.log('checked click');
    e.preventDefault();
    
    var ele = $(this);
    var id = ele.attr('id');
    
    ele.removeClass('fa-check-square-o checked').addClass('fa-square-o un-checked');
    markDone(id, false);
  });
  
  $(document).delegate('.un-checked', 'click', function(e) {
    console.log('unchecked click');
    e.preventDefault();
    
    var ele = $(this);
    var id = ele.attr('id');
    
    ele.removeClass('fa-square-o un-checked').addClass('fa-check-square-o checked');
    markDone(id, true);
  });
  
});
