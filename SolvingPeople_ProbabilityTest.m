%%% 2022.9.18
%%% A procedure for solving people 
% Assume you have 5 durgs, and there are 2 groups of people who
% need the drug. There are 5 persons in group A, and 1 person in group B. 
% The 5 persons in group A each needs 1 drug; the 1 person in group B needs
% 5 drugs. 
%%% Here is the way to distribute drugs for many times.

% Settings
clear;
Davidneed = 3;
Othersneed = 1;

% Statistics
Times = 1000;
DavidSavedTimes = 0;
ASavedTimes = 0;

for i = 1 : Times
    % i settings
    round = 1;
    drugs = 5;
    persons = {'David', 'A1', 'A2', 'A3', 'A4', 'A5'};
    luckyindex = 1;
    NumofPerRemain = length(persons);
    luckyname = persons(luckyindex);
    
    % Choosing Start
    while(drugs > 0 && NumofPerRemain > 0)
        %fprintf('Round %d: \n', round);
        luckyindex = randi(NumofPerRemain);
        luckyname = persons{luckyindex};
        if(strcmp(luckyname, 'David') && drugs < Davidneed)
            %fprintf('David should be saved, but the drugs are not enough. \n');
            continue;
        elseif(strcmp(luckyname, 'David') && drugs >= Davidneed)
            %%fprintf('The lucky guy is %s', luckyname);
            drugs = drugs - Davidneed;
            DavidSavedTimes = DavidSavedTimes + 1;
        else
            %%fprintf('The lucky guy is %s', luckyname);
            drugs = drugs - Othersneed;
            ASavedTimes = ASavedTimes + 1;
        end
        persons(luckyindex) = [];
        NumofPerRemain = NumofPerRemain - 1;
        round = round + 1;
        %fprintf('%s is saved. ', luckyname);
        %fprintf('After the round, %d persons remaining, %d drugs remaining. \n', NumofPerRemain, drugs);    
    end
end

fprintf('David saved probability %.3f \n', DavidSavedTimes ./ Times);
fprintf('Ai saved probability %.3f \n', ASavedTimes ./ (5 .* Times));



