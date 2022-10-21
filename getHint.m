function [] = getHint(handSum)   
% this function outputs a hint if the player asks for one, type of hint
% based on sum of players hand

    if (handSum) > 14 % if sum of hand greater than 14, less than 11, or else output specific hint based on sum
        if (handSum) == 21 % blackjack scenario
            fprintf("You have blackjack! You should always stand! You are not guaranteed to win but you cannot lose!\n");
        else % greater than 14 but not blackjack
            fprintf("You should stand, but it's not guaranteed you will win!\n");
        end
    elseif (handSum) < 12 % sum less than 12
        fprintf("You should hit! It's not possible to bust!\n");
    else % everything else
        fprintf("You should hit, but there is a possiblity you bust!\n");
    end


end