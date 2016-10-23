var gameScore = [];

getGame = function(turnNum) {
    // 1. get drinks object and ingredients object
    $.get('/game/new', function(response) {
        // initTurn(response, turnNum);
        console.log(response);
    });
};

getSession = function() {
  $.get('/game/new/session', function(response) {
    console.log('session: ' + response);
  });
};
// 2. to begin game, save drink name, id and ingredients and pass into FIRST turn.
// This function grabs the first drink in the game and passes it into turn function.
// initTurn = function(response, turnNum) {
//         var drinkName = response.drinks[turnNum].name;
//         var drinkId = response.drinks[turnNum].id;
//         var drinkIngredients = response.drinks[turnNum].ingredients;
//
//         turn(drinkName, drinkId, drinkIngredients, turnNum);
// };
//
// // 3. Turn function handles all the different functions involved in each turn.
// turn = function(drinkName, drinkId, drinkIngredients, turnNum) {
//   // creates an array that stores picked ingredients for each drink
//   var ingredientsArray = [];
//   displayDrinkName(drinkName);
//   logIngredients(ingredientsArray, drinkId, drinkIngredients, turnNum);
// };
//
// // 4. Display drinkName to the game page
// displayDrinkName = function(drinkName) {
//   $('.gameDrinkName').html(drinkName);
// };
//
// // 5. logIngredients assigns click event to each button, activating inactive class and removing active class
// logIngredients = function(ingredientsArray, drinkId, drinkIngredients, turnNum) {
//   $('body').on('click', '.active', function(event) {
//     $(this).addClass('inactive').removeClass('active');
//     ingredientsArray.push($(this).val());
//     // if 3 ingredients have been selected, deactivate all ingredients to prevent adding any more to the array.
//     if (ingredientsArray.length===3) {
//       $('button').addClass('inactive').removeClass('active');
//       checkAnswer(drinkId, ingredientsArray, drinkIngredients, turnNum);
//     }
//     $('button').off('click');
//   });
// };
//
// // 7. checkAnswer function compares ingredientsArray to drinkIngredients key
// checkAnswer = function(drinkId, ingredientsArray, drinkIngredients, turnNum) {
//     var correct = 1;
//     var incorrect = 0;
//
//     var sortedIngredientsArray = (ingredientsArray.sort().join(','));
//     var sortedDrinkIngredients = (drinkIngredients.sort().join(','));
//     console.log(sortedIngredientsArray);
//     console.log(sortedDrinkIngredients);
//
//     if (sortedIngredientsArray === sortedDrinkIngredients) {
//       console.log('You win!');
//       turnNum++;
//       callNextTurn(turnNum, drinkId, correct);
//     } else {
//       console.log("you lose!");
//       turnNum++;
//       callNextTurn(turnNum, drinkId, incorrect);
//     }
//     // pass correct/incorrect to array to save.
// };
//
// // 8. call next turn, if there have been 3 turns end game
// callNextTurn = function(turnNum, drinkId, score) {
//   var turnScore = [drinkId, score];
//   gameScore.push(turnScore);
//   getGame(turnNum);
//   $('button').removeClass('inactive');
//   $('button').addClass('active');
//   if(turnNum===5) {
//     alert('Game Over!');
//     console.log(gameScore);
//   }
// };
//
getGame();
getSession();
