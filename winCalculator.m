function [playerBalance, highscore, playerBalancesVector, playerHand, realPlayerHand, dealerHand, realDealerHand] = winCalculator(realPlayerHand, realDealerHand, playerBalance, bet, highscore, playerBalancesVector)
% this function check for current status of player and dealers hand and output winnings accordingly 
    playerBalance=playerBalance-bet; % intialise playerBalance after bet
    % calculate winnings and different bet outcomes

    if sum(realPlayerHand) > 21 % if player busts, output they lose and play lose sound
        [data,fs]=audioread('loseSound.wav');
        soundsc(data,fs);
        disp("Bust!");
        disp("The Dealer Wins!");
    elseif sum(realDealerHand) > 21 % if dealer busts, output player wins and play win sound
        [data,fs]=audioread('winSound.wav');
        soundsc(data,fs);
        disp("Winner Winner Chicken Dinner!");
        playerBalance=playerBalance+2*bet;
    elseif (sum(realPlayerHand) > sum(realDealerHand)) % if player sum is greater than dealer and not bust, output they won and play win sound
        [data,fs]=audioread('winSound.wav');
        soundsc(data,fs);
        disp("Winner Winner Chicken Dinner!");
        if sum(realPlayerHand) == 21
            disp("Blackjack!"); % if player sum is exactly 21, output blackjack
            playerBalance=playerBalance+2.5*bet;
        else
            playerBalance=playerBalance+2*bet;
        end
    elseif sum(realDealerHand) == sum(realPlayerHand)
        disp("It's a tie!") % if player sum is dealer sum, output it's a tie
        playerBalance=playerBalance+bet;
    else
        [data,fs]=audioread('loseSound.wav'); % output you lose and lose sound in any other scenario
        soundsc(data,fs);
        disp("The Dealer Wins!")
    end
    fprintf("Your current balance is: %0.0f\n",playerBalance); % show the current balance
    % set current highscore if applicable
    if playerBalance>highscore
        highscore=playerBalance;
    end
    % reinitialise some variables needed to reset game state
    playerBalancesVector=[playerBalancesVector playerBalance];
    playerHand=[];
    realPlayerHand=[];
    dealerHand=[];
    realDealerHand=[];

end