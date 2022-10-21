clc
[playerBalance, highscore, singleAce, playerBalancesVector, currentCard, playerHand, realPlayerHand, dealerHand, realDealerHand, showDealer, finalOutput, gameOn, getHintsBoolean] = intialisation(); % intialise game
clc
while playerBalance > 0 && gameOn==true % keep repeating game until balance is 0

    % collate first turn functions
    [deck] = shuffleDeck(); % build deck
    [bet] = playerBet(playerBalance); % get intial bet
    clc
    [playerHand,currentCard,deck]=addCard(currentCard,deck,playerHand);
    [playerHand,currentCard,deck]=addCard(currentCard,deck,playerHand); % add 2 cards to player hand
    [realPlayerHand,playerSuit] = cardFinder(playerHand); % convert reference cards to actual cards

    [dealerHand,currentCard,deck]=addCard(currentCard,deck,dealerHand);
    [dealerHand,currentCard,deck]=addCard(currentCard,deck,dealerHand); % add 2 cards to dealer hand
    [realDealerHand,dealerSuit] = cardFinder(dealerHand); % convert reference cards to actual cards

    [realDealerHand] = aceConversion(realDealerHand, singleAce); % convert dealer aces to 11 when applicable
    [realPlayerHand] = aceConversion(realPlayerHand, singleAce); % convert player aces to 11 when applicable

    currentStatus(realPlayerHand,playerSuit,realDealerHand,dealerSuit,showDealer,finalOutput,playerBalance,highscore,playerBalancesVector); % output current status

    % ask the player if they want a hint if applicable
    if getHintsBoolean==true
        getHint(sum(realPlayerHand)); 
    end
     % collate player choice functions
    [choice] = playerChoice();
    
    while choice == "hit" || choice == "Hit" % while loop checks for current player move
        clc
        [playerHand,currentCard,deck]=addCard(currentCard,deck,playerHand); % add 1 more card to player hand
        [realPlayerHand,playerSuit]=cardFinder(playerHand); % convert reference cards to actual cards
        [realPlayerHand] = aceConversion(realPlayerHand, singleAce); % convert player aces to 11 when applicable
        currentStatus(realPlayerHand,playerSuit,realDealerHand,dealerSuit,showDealer,finalOutput,playerBalance,highscore,playerBalancesVector); % output current status

        if sum(realPlayerHand) > 21 % if bust, break while loop
            break
        end

        if getHintsBoolean==true % ask if they want another hint
            getHint(sum(realPlayerHand)); 
        end 
        [choice] = playerChoice(); % get choice again

    end
    % if not bust, continue player / dealer functions
    if sum(realPlayerHand) <= 21

        % collate dealer choice functions
        while sum(realDealerHand) <= 16 % while loop continues to hit dealer until dealer hand sum > 16
            [dealerHand,currentCard,deck]=addCard(currentCard,deck,dealerHand); % repeat hit function but with dealer hand this time
            [realDealerHand,dealerSuit]=cardFinder(dealerHand); % convert reference cards to actual card
        end

        [realDealerHand] = aceConversion(realDealerHand, singleAce); % convert dealer aces to 11 when applicable 
        showDealer=true; % change boolean for currentStatus parameter
        clc
        currentStatus(realPlayerHand,playerSuit,realDealerHand,dealerSuit,showDealer,finalOutput,playerBalance,highscore,playerBalancesVector); % call current status with full dealer hand
        showDealer=false; % change boolean back for later
    end
    
    % player win status, bet calculations, high score plotting, sounds
    [playerBalance, highscore, playerBalancesVector,playerHand, realPlayerHand, dealerHand, realDealerHand] = winCalculator(realPlayerHand, realDealerHand, playerBalance, bet, highscore, playerBalancesVector);

    % check if player wants to play anymore
    if playerBalance > 0
    [gameOn] = playerGameChoice();
    end

end

% final outputs
finalOutput=true; % change boolean for final status
currentStatus(realPlayerHand,playerSuit,realDealerHand,dealerSuit,showDealer,finalOutput,playerBalance,highscore,playerBalancesVector);

