var
  $width = $('#page-width'),
  $breakpoint = $('#breakpoint'),
  $breakpoints = $('#breakpoints'),
  $window = $(window),
  requestBreakpoints = $.get('breakpoints.json'),
  breakpoints = [];

  
function updateScreenValues () {
  width = $window.width();
  $width.text(width + 'px');
  
  if (breakpoints.length > 0) {
  
    var closestBreakpoint = "N/A";
    $breakpoint.text(closestBreakpoint);
    
    breakpoints.some( function(rawBreakpoint) {
      breakpoint = parseInt(rawBreakpoint);
      console.log(breakpoint, breakpoint > width);
      if (breakpoint > width) {
        $breakpoint.text(breakpoint + 'px');
        return true;
      }
      
    });

  }
}
updateScreenValues();
$(window).resize(function () { updateScreenValues() });


// callback handler that will be called on success
requestBreakpoints.done(function (response, textStatus, jqXHR){

    breakpoints = response;
    
    $breakpoints.text( JSON.stringify(breakpoints) );    
    updateScreenValues();
});

