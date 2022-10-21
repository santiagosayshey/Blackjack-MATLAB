function [] = currentStatus(realPlayerHand,playerSuit,realDealerHand,dealerSuit,showDealer,finalOutput,playerBalance,highscore,playerBalancesVector)
% this function outputs the dealers and the players hand

    if finalOutput == false % choose for final or not output       
        if showDealer == false % choose for final dealer output in full
            fprintf("Dealer Hand:\n");
            fprintf("?\n");
            for i=2:length(realDealerHand)
                if realDealerHand(i) == 1 || realDealerHand(i) == 11 % if card is ace
                    fprintf("Ace of %s\n",dealerSuit(i)); % print ace instead of 1
                else
                    fprintf("%d of %s\n",realDealerHand(i),dealerSuit(i)); % print number
                end
            end
            fprintf("\n");
            fprintf("Player Hand:\n");
            
            % do the same thing for the player hand
            for i=1:length(realPlayerHand)
                if realPlayerHand(i) == 1 || realPlayerHand(i) == 11
                    fprintf("Ace of %s\n",playerSuit(i));
                else
                    fprintf("%d of %s\n",realPlayerHand(i),playerSuit(i));
                end
            end
            fprintf("Player count: %d\n",sum(realPlayerHand));
        
        else 
            % do the same thing for dealer and player but show dealer hand
            % in full
            fprintf("Dealer Hand:\n");
            for i=1:length(realDealerHand)
                if realDealerHand(i) == 1 || realDealerHand(i) == 11
                    fprintf("Ace of %s\n",dealerSuit(i));
                else
                    fprintf("%d of %s\n",realDealerHand(i),dealerSuit(i));
                end
            end
            fprintf("Dealer count: %d\n",sum(realDealerHand));
            fprintf("\n");
        
            fprintf("Player Hand:\n");
            for i=1:length(realPlayerHand)
                if realPlayerHand(i) == 1 || realPlayerHand(i) == 11
                    fprintf("Ace of %s\n",playerSuit(i));
                else
                    fprintf("%d of %s\n",realPlayerHand(i),playerSuit(i));
                end
            end
            fprintf("Player count: %d\n",sum(realPlayerHand));
            fprintf("\n");
        end
    % true final boolean, output final outputs
    else
        if playerBalance == 0
            disp("You're Broke!"); % tell player they are broke
        end
        fprintf("Your highest balance was: %d\n",highscore); % show their highest balance
        plot(playerBalancesVector); % create graph and show player
        title("Player Balance Over Time");
        xlabel("Game");
        ylabel("Balance");
    end
end