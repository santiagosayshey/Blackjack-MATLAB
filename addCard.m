function [hand,currentCard,deck]=addCard(currentCard,deck,hand)
% this function adds another card to any hand

if currentCard >= 48 % if current card is more than 48th, shuffle the deck again and set current card as 1
    deck=shuffleDeck();
    currentCard=1;
end

% read in the length of the hand and append new card to it
hand(length(hand)+1)=deck(currentCard);
% update current card to reflect this
currentCard=currentCard+1;

end