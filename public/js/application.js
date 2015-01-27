$(document).ready(function() {
  selectTeam()
  returnHome()
});



function selectTeam() {
  $(".navlink").on("click", function(event){
    event.preventDefault()

      console.log($(this).attr("href"))
      url = $(this).attr("href")

    $.ajax({
      url: url
    }).success(function(response){
      console.log(response)
      $(".upcoming_games").html(response)
    }).fail(function(response){
      console.log("fail" + response)
    })
  })
}

function returnHome() {
  $("#home").on("click", function(event){
    event.preventDefault()

    $.ajax({
      url: "/home"
    }).success(function(response){
      console.log(response)
      $(".upcoming_games").html(response)
    }).fail(function(response){
      console.log("fail" + response)
    })
  })
}

// function hideRoster() {
//   $(".upcoming_games").on("click", "#hide_roster", function(){
//     console.log($(this).parent().parent())
//     $(this).parent().remove()
//   })
// }