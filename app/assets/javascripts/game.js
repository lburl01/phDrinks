var gameScore = [];

getSession = function() {
  $.get('/game/new/session', function(response) {
    var sessionNum = response;
    getGame(0, sessionNum);
  });
};

getGame = function(turnNum, sessionNum) {
    // 1. get drinks object and ingredients object
    $.get('/game/new', function(response) {
        initTurn(response, turnNum, sessionNum);
    });
};

// 2. to begin game, save drink name, id and ingredients and pass into FIRST turn.
// This function grabs the first drink in the game and passes it into turn function.
initTurn = function(response, turnNum, sessionNum) {
        var drinkName = response.drinks[turnNum].name;
        var drinkId = response.drinks[turnNum].id;
        var drinkIngredients = response.drinks[turnNum].ingredients;

        turn(drinkName, drinkId, drinkIngredients, turnNum, sessionNum);
};

// 3. Turn function handles all the different functions involved in each turn.
turn = function(drinkName, drinkId, drinkIngredients, turnNum, sessionNum) {
  // creates an array that stores picked ingredients for each drink
  var ingredientsArray = [];
  displayDrinkName(drinkName);
  logIngredients(ingredientsArray, drinkId, drinkIngredients, turnNum, sessionNum);
};

// 4. Display drinkName to the game page
displayDrinkName = function(drinkName) {
  $('.gameDrinkName').html(drinkName);
};

// 5. logIngredients assigns click event to each button, activating inactive class and removing active class
logIngredients = function(ingredientsArray, drinkId, drinkIngredients, turnNum, sessionNum) {
  $('body').on('click', '.active', function(event) {
    $(this).addClass('inactive').removeClass('active');
    ingredientsArray.push($(this).val());
    // if 3 ingredients have been selected, deactivate all ingredients to prevent adding any more to the array.
    if (ingredientsArray.length===3) {
      $('button').addClass('inactive').removeClass('active');
      checkAnswer(drinkId, ingredientsArray, drinkIngredients, turnNum, sessionNum);
    }
    $('button').off('click');
  });
};

// 7. checkAnswer function compares ingredientsArray to drinkIngredients key
checkAnswer = function(drinkId, ingredientsArray, drinkIngredients, turnNum, sessionNum) {
    var correct = 1;
    var incorrect = 0;

    var sortedIngredientsArray = (ingredientsArray.sort().join(','));
    var sortedDrinkIngredients = (drinkIngredients.sort().join(','));

    if (sortedIngredientsArray === sortedDrinkIngredients) {
      console.log('you won!');
      turnNum++;
      callNextTurn(sessionNum, turnNum, drinkId, correct);
    } else {
      console.log('you lost, loser');
      turnNum++;
      callNextTurn(sessionNum, turnNum, drinkId, incorrect);
    }
    // pass correct/incorrect to array to save.
};

// 8. call next turn, if there have been 3 turns end game
callNextTurn = function(sessionNum, turnNum, drinkId, score) {

  var turnScore = {
    drink_id: drinkId,
    session: sessionNum,
    score: score
  };
  gameScore.push(turnScore);

  $.ajax({
    type: 'POST',
    url: '/game/create',
    data: turnScore,
    // dataType: 'json',
    success: function() {
      console.log('in');
    }
  });

  getGame(turnNum, sessionNum);
  $('button').removeClass('inactive');
  $('button').addClass('active');
  if(turnNum===5) {
    console.log(gameScore);
    $('.gameBanner').fadeIn('slow', function() {
      $('.gameBanner').children('p').addClass('rollIn');
    });
    $('.gameBanner').html('<p>Game Over!<br><span> % correct</span></p>');
  }
};

getSession();
