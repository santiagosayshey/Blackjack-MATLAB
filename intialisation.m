function [playerBalance, highscore, singleAce, playerBalancesVector, currentCard, playerHand, realPlayerHand, dealerHand, realDealerHand, showDealer, finalOutput, gameOn, getHintsBoolean] = intialisation()
% this function outputs the rules of the game, asks the user if they want to enable hints and intialises some variables

fprintf("Welcome to Blackjack! Have fun and gamble responsibly!\n\n"); % output greeting

% set valid choice as false to start loop
validChoice=false;
while validChoice==false % check for valid choice
    viewRules=input("Do you want to view the rules? Y/N: ","s"); % view rules
    if viewRules == "y" || viewRules == "Y" || viewRules == "yes" || viewRules == "Yes" % if player wants to view rules, view rules and update valid choice
        fprintf("The goal of Blackjack is to have a hand sum greater than the dealer.\n\nYou start with 2 cards and can continue to draw until your sum is greater than 21.\n\nThe hand with the highest sum wins!\n\n");
        validChoice=true;
    elseif viewRules == "n" || viewRules == "N" || viewRules == "no" || viewRules == "No" % update valid choice
        validChoice=true;
    else
        fprintf("Enter a valid choice!\n"); % keep repeating prompt until a valid choice is entered
    end
end

% set valid choice as false to start loop
validChoice=false;
while validChoice==false % check for valid choice
    getHintsChoice=input("Do you want to enable hints? Y/N: ","s"); % ask user if they want hints enabled
    if getHintsChoice == "y" || getHintsChoice == "Y" || getHintsChoice == "yes" || getHintsChoice == "Yes" % if player wants to view hints, view hints and update valid choice
        validChoice=true;
        getHintsBoolean=true;
    elseif getHintsChoice == "n" || getHintsChoice == "N" || getHintsChoice == "no" || getHintsChoice == "No" % update valid choice
        validChoice=true;
        getHintsBoolean=false;
    else
        fprintf("Enter a valid choice!\n"); % keep repeating prompt until a valid choice is entered
    end
end

% get input on balance
playerBalance=input("How much money do you have? ");
playerBalancesVector=[playerBalance];

% intial variables needed for future functions
highscore=0;
singleAce=false;
currentCard = 1;
playerHand=[];
realPlayerHand=[];
dealerHand=[];
realDealerHand=[];
showDealer=false;
finalOutput=false;
gameOn=true;
end