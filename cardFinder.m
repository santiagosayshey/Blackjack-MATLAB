function [realHand,suit] = cardFinder(hand)
% the card finder functions assigns a specific card to random integers in a hand
% can be used with any size hand
% iterate through the hand size
    for i=1:length(hand)
    
        % check for location of element and assign suit / number accordingly
        if hand(i) > 0 && hand(i) < 14 % all cards between 1 and 14
            suit(i)="Clubs"; % set suit
            if hand(i) == 1
                realHand(i) = 1; % 1s are aces
            elseif hand(i) == 11 % king is worth 10
                realHand(i) = 10; 
            elseif hand(i) == 12 % queen is worth 10
                realHand(i) = 10;
            elseif hand(i) == 13 % jack is worth 10
                realHand(i) = 10;
            else                             
                realHand(i)=hand(i);
            end
            % repeat same process for all other cards but take away a
            % mulitple of 13 for each mulitple of 13 in the deck 
        elseif hand(i) > 13 && hand(i) < 27
            suit(i)="Spades";
            if hand(i) == 14
                realHand(i) = 1;
            elseif hand(i) == 24
                realHand(i) = 10;
            elseif hand(i) == 25
                realHand(i) = 10;
            elseif hand(i) == 26
                realHand(i) = 10;
            else                             
                realHand(i)=hand(i)-13;
            end
        elseif hand(i) > 26 && hand(i) < 40
            suit(i)="Hearts";
            if hand(i) == 27
                realHand(i) = 1;
            elseif hand(i) == 37
                realHand(i) = 10;
            elseif hand(i) == 38
                realHand(i) = 10;
            elseif hand(i) == 39
                realHand(i) = 10; 
            else                             
                realHand(i)=hand(i)-26;
            end
        elseif hand(i) > 39
            suit(i)="Diamonds";
            if hand(i) == 40
                realHand(i) = 1;
            elseif hand(i) == 50
                realHand(i) = 10;
            elseif hand(i) == 51
                realHand(i) = 10;
            elseif hand(i) == 52
                realHand(i) = 10;    
            else                             
                realHand(i)=hand(i)-39;
            end
        end
    end
end