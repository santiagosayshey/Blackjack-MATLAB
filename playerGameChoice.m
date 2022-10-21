function [gameOn] = playerGameChoice()

    validChoice=false; % choose valid choice as false for while loop
    while validChoice==false
        gameOnChoice=input("Do you want to keep playing? Y/N: ","s"); % get input on choice
        if gameOnChoice=="n" || gameOnChoice=="N" || gameOnChoice=="no" || gameOnChoice=="No" % check for valid choice, update boolean if true
            gameOn=false;
            validChoice=true;
        elseif gameOnChoice=="y" || gameOnChoice=="Y" || gameOnChoice=="yes" || gameOnChoice=="Yes" % check for valid choice, update boolean if true
            gameOn=true; 
            validChoice=true; % if valid, stop loop
        else
            fprintf("Enter a valid choice!\n"); % else, keep prompting user to enter a valid choice until they do
        end
    end

end