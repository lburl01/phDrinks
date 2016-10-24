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
        console.log(response);
    });
};

// 2. to begin game, save drink name, id and ingredients and pass into FIRST turn.
// This function grabs the first drink in the game and passes it into turn function.
initTurn = function(response, turnNum, sessionNum) {
    console.log('turn num is' + turnNum);
        var drinkName = response.drinks[turnNum].name;
        var drinkId = response.drinks[turnNum].id;
        var drinkIngredients = response.drinks[turnNum].ingredients;

        turn(response, drinkName, drinkId, drinkIngredients, turnNum, sessionNum);
};

// 3. Turn function handles all the different functions involved in each turn.
turn = function(response, drinkName, drinkId, drinkIngredients, turnNum, sessionNum) {
  // creates an array that stores picked ingredients for each drink
  var ingredientsArray = [];
  displayDrinkName(drinkName);
  logIngredients(response, ingredientsArray, drinkId, drinkIngredients, turnNum, sessionNum);
};

// 4. Display drinkName to the game page
displayDrinkName = function(drinkName) {
  $('.gameDrinkName').html(drinkName);
};

// 5. logIngredients assigns click event to each button, activating inactive class and removing active class
logIngredients = function(response, ingredientsArray, drinkId, drinkIngredients, turnNum, sessionNum) {
  $('body').on('click', '.active', function(event) {
    $(this).addClass('inactive').removeClass('active');
    ingredientsArray.push($(this).val());
    // if 3 ingredients have been selected, deactivate all ingredients to prevent adding any more to the array.
    if (ingredientsArray.length===3) {
      $('button').addClass('inactive').removeClass('active');
      checkAnswer(response, drinkId, ingredientsArray, drinkIngredients, turnNum, sessionNum);
    }
    $('button').off('click');
  });
};

// 7. checkAnswer function compares ingredientsArray to drinkIngredients key
checkAnswer = function(response, drinkId, ingredientsArray, drinkIngredients, turnNum, sessionNum) {
    var correct = 1;
    var incorrect = 0;

    var sortedIngredientsArray = (ingredientsArray.sort().join(','));
    var sortedDrinkIngredients = (drinkIngredients.sort().join(','));

    if (sortedIngredientsArray === sortedDrinkIngredients) {
      // console.log('you won!');
      callNextTurn(response, sessionNum, turnNum, drinkId, correct);
    } else {
      // console.log('you lost, loser');
      callNextTurn(response, sessionNum, turnNum, drinkId, incorrect);
    }
};

// 8. call next turn, if there have been 3 turns end game
callNextTurn = function(response, sessionNum, turnNum, drinkId, score) {
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
      // console.log('ajax post success');
    }
  });

  $('button').removeClass('inactive');
  $('button').addClass('active');

  turnNum++;

  if(turnNum===5) {
    $('.gameBanner').fadeIn('slow', function() {
      $('.gameBanner').children('p').addClass('rollIn');
      calculateScore(gameScore);
    });
  } else {
    initTurn(response, turnNum, sessionNum);
  }
};

calculateScore = function(gameScore) {
  var score = 0;
  for(count=0; count<gameScore.length; count++) {
    if (gameScore[count].score === 0) {
      score = score;
    } else if (gameScore[count].score === 1) {
      score++;
    }
  }

  $('.button_to:nth-child(1)').prepend('<p>Game Over!<br><span>'+ score + ' out of 5 correct</span></p>');
};

getSession();
