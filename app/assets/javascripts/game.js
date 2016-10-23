
getGame = function(turnNum) {
    // 1. get drinks object and ingredients object
    $.get('/game/new', function(response) {
        initTurn(response, turnNum);
    });
};
// 2. to begin game, save drink name, id and ingredients and pass into FIRST turn.
// This function grabs the first drink in the game and passes it into turn function.
initTurn = function(response, turnNum) {
        var drinkName = response.drinks[turnNum].name;
        var drinkId = response.drinks[turnNum].id;
        var drinkIngredients = response.drinks[turnNum].ingredients;

        turn(drinkName, drinkId, drinkIngredients, turnNum);
};

// 3. Turn function handles all the different functions involved in each turn.
turn = function(drinkName, drinkId, drinkIngredients, turnNum) {
  // creates an array that stores picked ingredients for each drink
  var ingredientsArray = [];
  displayDrinkName(drinkName);
  logIngredients(ingredientsArray, drinkIngredients, turnNum);
};

// 4. Display drinkName to the game page
displayDrinkName = function(drinkName) {
  $('.gameDrinkName').html(drinkName);
};

// 5. logIngredients assigns click event to each button, activating inactive class and removing active class
logIngredients = function(ingredientsArray, drinkIngredients, turnNum) {
  $('body').on('click', '.active', function(event) {
    $(this).addClass('inactive').removeClass('active');
    ingredientsArray.push($(this).val());
    // if 3 ingredients have been selected, deactivate all ingredients to prevent adding any more to the array.
    if (ingredientsArray.length===3) {
      $('button').addClass('inactive').removeClass('active');
      checkAnswer(ingredientsArray, drinkIngredients, turnNum);
    }
    $('button').off('click');
  });
};

// 7. checkAnswer function compares ingredientsArray to drinkIngredients key
checkAnswer = function(ingredientsArray, drinkIngredients, turnNum) {
  // var drinkArray = [];
  // for (count=0; count<drinkIngredients.length; count++) {
  //   drinkArray.push(drinkIngredients[count].id);
  // }
    var sortedIngredientsArray = (ingredientsArray.sort().join(','));
    var sortedDrinkIngredients = (drinkIngredients.sort().join(','));
    console.log(sortedIngredientsArray);
    console.log(sortedDrinkIngredients);

    if (sortedIngredientsArray === sortedDrinkIngredients) {
      console.log('You win!');
      // pass 1
    } else {
      console.log("you lose!");
      // pass 0
    }
    // pass correct/incorrect to array to save.
    turnNum++;
    callNextTurn(turnNum);
};

// 8. call next turn, if there have been 3 turns end game
callNextTurn = function(turnNum) {
  getGame(turnNum);
  $('button').removeClass('inactive');
  $('button').addClass('active');
  if(turnNum===3) {
    alert('Game Over!');
  }
};

getGame(0);
