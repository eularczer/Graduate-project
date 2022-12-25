%%% 2022.9.18
%%% A procedure for solving people 
% Assume you have 5 durgs, and there are 2 groups of people who
% need the drug. There are 5 persons in group A, and 1 person in group B. 
% The 5 persons in group A each needs 1 drug; the 1 person in group B needs
% 5 drugs. 
%%% Here is the way to distribute drugs.

% Settings
clear;
round = 1;
drugs = 5;
persons = {'David', 'A1', 'A2', 'A3', 'A4', 'A5'};
Davidneed = 5;
Othersneed = 1;

% Choosing start
luckyindex = 1;
NumofPerRemain = length(persons);
luckyname = persons(luckyindex);
while(drugs > 0 && NumofPerRemain > 0)
        fprintf('Round %d: \n', round);
        luckyindex = randi(NumofPerRemain);
        luckyname = persons{luckyindex};
        if(strcmp(luckyname, 'David') && drugs < Davidneed)
            fprintf('David should be saved, but the drugs are not enough. \n');
            continue;
        elseif(strcmp(luckyname, 'David') && drugs >= Davidneed)
            %%fprintf('The lucky guy is %s', luckyname);
            drugs = drugs - Davidneed;
        else
            %%fprintf('The lucky guy is %s', luckyname);
            drugs = drugs - Othersneed;
        end
        persons(luckyindex) = [];
        NumofPerRemain = NumofPerRemain - 1;
        round = round + 1;
        fprintf('%s is saved. ', luckyname);
        fprintf('After the round, %d persons remaining, %d drugs remaining. \n', NumofPerRemain, drugs);    
end



