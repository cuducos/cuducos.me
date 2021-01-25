 $(document).ready(function () {
  window.originalPos = 0;
  $('.grid_6 .grid_2')
   .mouseover(function(){
    window.originalPos = $(this).css('background-position');
    $(this).css('background-position','-560px 0');
   }).mouseout(function(){
    $(this).css('background-position',window.originalPos);
   });
 });