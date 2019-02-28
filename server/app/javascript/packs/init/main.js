$(function(){
    var accountShowingTime = 300;
    
    $('.my-account').on('click', function(event) {
        $('.my-account-block').fadeToggle(accountShowingTime);
        event.stopPropagation();
    });
    
    $(document).click( function(event){
      if( $(event.target).closest(".my-account-block").length ) 
        return;
      $(".my-account-block").fadeOut(accountShowingTime);
      event.stopPropagation();
    });
});
