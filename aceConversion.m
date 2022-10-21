function [hand] = aceConversion(hand, singleAce)
% this function converts dealer aces to 11 where applicable


    for i=1:length(hand)
        if i < 3 % converts aces only if their the 1st or second card of the hand
            if hand(i) == 1 && singleAce == false % converts only single ace if more than 2 aces in intial hand
                hand(i) = 11; % change 1 to 11
                singleAce=true; % update singleAce to true
            end
        end
    end
    
end