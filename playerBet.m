function [bet] = playerBet(playerBalance)
% this function intialises bet and checks if its viable
correctBet=false; % correct bet is false to start loop
    while correctBet == false
        bet=input("How much do you want to bet? "); % get input of bet
        if bet <= playerBalance && bet > 0 % domain of improper bets, check if true
            correctBet=true; % update correct bet if true
        else
            fprintf("Please enter a valid bet!\n"); % keep prompting user until they enter a valid bet
        end
    end
end