$(document).ready(function() {
  getRoster()
  hideRoster()
});



function getRoster() {
  $(".upcoming_games").on("click", ".roster", function(event){
    event.preventDefault()

      console.log($(this).attr("href"))
      url = $(this).attr("href")
      $clicked = $(this)

    $.ajax({
      url: url
    }).success(function(response){
      console.log(response)
      $clicked.parent().append(response)
    }).fail(function(response){
      console.log("fail" + response)
    })
  })
}

function hideRoster() {
  $(".upcoming_games").on("click", "#hide_roster", function(){
    console.log("clickinggg")
    console.log($(this).parent())
    $(this).parent().css("display", "none")
  })
}