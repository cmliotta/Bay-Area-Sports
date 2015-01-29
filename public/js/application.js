$(document).ready(function() {
  selectTeam()
  returnHome()
  selectGame()
  postComment()
});

function selectTeam() {
  $(".navlink").on("click", function(event){
    event.preventDefault()

      console.log($(this).attr("href"))
      url = $(this).attr("href")

    $.ajax({
      url: url
    }).success(function(response){
      $(".upcoming_games").html(response)
    }).fail(function(response){
      console.log("fail" + response)
    })
  })
}

function selectGame() {
  $(".upcoming_games").on("click", ".game_link", function(event){
    event.preventDefault()

    url = $(this).attr("href")
    console.log(url)

    $.ajax({
      url: url
    }).success(function(response){
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
      $(".upcoming_games").html(response)
    }).fail(function(response){
      console.log("fail" + response)
    })
  })
}

function postComment(){
  $(".upcoming_games").on("submit", "#add_comment", function(event){

    event.preventDefault()
    data = $(this).serialize()

    $.ajax({
      url: '/comment',
      type: 'POST',
      data: data,
      dataType: "json"
    }).success(function(response){
      $(".user_comments").append("<li class=\'" + 'new_comment' + "\'>" + response.username + ": " + response.body + "</li>")
    }).fail(function(response){
      console.log("fail" + response)
    })
  })
}