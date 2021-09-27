%% Fragility Curves
clc;
clear;
close all;

a = importdata('logNormal_Score3.0_Statics.txt');

values = a.data;  % all data

GPA_i =values(:,1)'; % each GPA level (e.g., 3.3, 3.4, 3.5, …, 5.0)
n_i = values(:,2)'; % number of records used at each GPA level
z_i = values(:,3)'; % number of no failings at each GPA level

% probit regression
Y = [z_i' n_i']; % vector of number of no failings and number of records at each level
[b,d] = glmfit(log(GPA_i'),Y,'binomial','link', 'probit');

% convert probit coefficients to lognormal distribution parameters
sigma_ln = 1/b(2)
mu_ln = -b(1)/b(2)

% predicted probabilities of no failure, using the fitted fragility function
GPA_2=3:.05:5;
p_nofailure = normcdf(log(GPA_2), mu_ln, sigma_ln);


figure
plot(GPA_i, 1-z_i./n_i, 'o','MarkerEdge',[0.2 0.2 0.2])
hold on
plot(GPA_2, 1-p_nofailure, '-k', 'linewidth', 3)
[legh, objh] = legend('Observations', 'Fitted Fragility Function', 'Location','northeast');
set(legh, 'fontsize', 12,'FontName','Times')
hx = xlabel('GPA', 'Fontsize', 11, 'FontName','Times');
hy = ylabel('P(CG < 3.0)', 'Fontsize', 11, 'FontName','Times');
ylim([0 1])
axis([3.3 5 0 1])
grid on
hold off

figure
plot(GPA_i, z_i./n_i, 'o','MarkerEdge',[0.2 0.2 0.2])
hold on
plot(GPA_2, p_nofailure, '-k', 'linewidth', 3)
[legh, objh] = legend('Observations', 'Fitted Fragility Function', 'Location','southeast');
set(legh, 'fontsize', 12,'FontName','Times')
hx = xlabel('GPA', 'Fontsize', 11, 'FontName','Times');
hy = ylabel('P(CG > 3.0)', 'Fontsize', 11, 'FontName','Times');
ylim([0 1])
axis([3.3 5 0 1])
grid on
hold off
