function [choice] = playerChoice()
% this function prompts the user for a choice and decides whether it is
% valid or not

    correctChoice = false; % choice is false to start while loop
    while correctChoice == false 
        choice=string(input("Hit or Stand? ","s")); % get input for initial choice
        fprintf("\n\n");

        if choice == "hit" || choice == "stand" || choice == "Stand" || choice == "Hit" % if choice hit or stand, say choice is valid
            correctChoice = true;
        else
            fprintf("Enter a valid choice!\n"); % otherwise, prompt user to enter a valid choice until they do
        end
    end
end
