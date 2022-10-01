clear

load('fig_S3_barplot.mat','longiPET_high*','longiPET_low*')

figure('color','w'),
 [~,p1,~,tstat1]=ttest2(longiPET_high_s2,longiPET_high_s1)
 [~,p2,~,tstat2]=ttest2(longiPET_high_s3,longiPET_high_s1)
 [~,p3,~,tstat3]=ttest2(longiPET_high_s3,longiPET_high_s2)


SEM_s1 = std(longiPET_high_s1)/sqrt(length(longiPET_high_s1));
SEM_s2 = std(longiPET_high_s2)/sqrt(length(longiPET_high_s2));
SEM_s3 = std(longiPET_high_s3)/sqrt(length(longiPET_high_s3));
 

b1=bar(1,mean(longiPET_high_s1));
hold on,
b2=bar(2,mean(longiPET_high_s2)),
b3=bar(3,mean(longiPET_high_s3)),

b1.FaceColor = [0.6350 0.6350 0.6350];
b2.FaceColor = [0.8500 0.3250 0.0980];
b3.FaceColor = [0 0.4470 0.7410];

b1.EdgeColor = [0 0 0];
b2.EdgeColor = [0 0 0];
b3.EdgeColor = [0 0 0];

b1.LineWidth=1.5;
b2.LineWidth=1.5;
b3.LineWidth=1.5;

e1=errorbar(1,mean(longiPET_high_s1),SEM_s1),
e2=errorbar(2,mean(longiPET_high_s2),SEM_s2),
e3=errorbar(3,mean(longiPET_high_s3),SEM_s3),

e1.Color=[0 0 0];
e2.Color=[0 0 0];
e3.Color=[0 0 0];

e1.LineWidth=2;
e2.LineWidth=2;
e3.LineWidth=2;

xticks([1 2 3]),xticklabels({'s1','s2','s3'}),
set(gca,'fontsize', 30),
set(gca,'linewidth',2),



%%%% low 
 [~,p1,~,tstat1]=ttest2(longiPET_low_s2,longiPET_low_s1)
 [~,p2,~,tstat2]=ttest2(longiPET_low_s3,longiPET_low_s1)
 [~,p3,~,tstat3]=ttest2(longiPET_low_s3,longiPET_low_s2)


SEM_s1 = std(longiPET_low_s1)/sqrt(length(longiPET_low_s1));
SEM_s2 = std(longiPET_low_s2)/sqrt(length(longiPET_low_s2));
SEM_s3 = std(longiPET_low_s3)/sqrt(length(longiPET_low_s3));
 

b1=bar(5,mean(longiPET_low_s1));
hold on
b2=bar(6,mean(longiPET_low_s2)),
b3=bar(7,mean(longiPET_low_s3)),

b1.FaceColor = [0.6350 0.6350 0.6350];
b2.FaceColor = [0.8500 0.3250 0.0980];
b3.FaceColor = [0 0.4470 0.7410];

b1.EdgeColor = [0 0 0];
b2.EdgeColor = [0 0 0];
b3.EdgeColor = [0 0 0];

b1.LineWidth=1.5;
b2.LineWidth=1.5;
b3.LineWidth=1.5;

e1=errorbar(5,mean(longiPET_low_s1),SEM_s1),
e2=errorbar(6,mean(longiPET_low_s2),SEM_s2),
e3=errorbar(7,mean(longiPET_low_s3),SEM_s3),

e1.Color=[0 0 0];
e2.Color=[0 0 0];
e3.Color=[0 0 0];

e1.LineWidth=2;
e2.LineWidth=2;
e3.LineWidth=2;

xticks([1 2 3 5 6 7]),xticklabels({'s1','s2','s3','s1','s2','s3'}),ylim([-0.005 0.04])
set(gca,'fontsize', 30),
set(gca,'linewidth',2),

