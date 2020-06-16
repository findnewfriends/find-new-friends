$(document).ready(function() {

  // $("#emails-list").children().click(function(){
  $("div[id*='request-button-match']").on('click','form', function() {
    // let match_id = event.target.id.slice(21);
    let match_id = event.target.parentNode.id.slice(21);
    console.log(`div botton for match ${match_id}`);

    $.ajax({
    type:'PATCH',
    url: `/matches/${match_id}`,
    // data: { match: match_id },
    // data: { match: { user: parseInt(match_id)}} ,
    dataType: "script",
    success: function(result){
      console.log(`match updated! success!!!`);
    }
    });


  });



// LAST CLOSURE
});
