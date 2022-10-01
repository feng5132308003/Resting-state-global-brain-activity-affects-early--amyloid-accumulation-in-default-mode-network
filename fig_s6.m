clear

load('mats/test_regr_motion_1.mat','cp_s*','csf_ptau_s2','csf_ttau_s2','csf_abeta_s2','suvr_s2','id_test*','cp_208_regr','idx_s*')

figure('color','w','Position', [100 100 1800 1800]),
ax=subplot(431),

 [~,p1,~,tstat1]=ttest2(cp_s2,cp_s1)
 [~,p2,~,tstat2]=ttest2(cp_s3,cp_s1)
 [~,p3,~,tstat3]=ttest2(cp_s3,cp_s2)


SEM_s1 = std(cp_s1)/sqrt(length(cp_s1));
SEM_s2 = std(cp_s2)/sqrt(length(cp_s2));
SEM_s3 = std(cp_s3)/sqrt(length(cp_s3));
 

b1=bar(1,mean(cp_s1));
hold on,
b2=bar(2,mean(cp_s2)),
b3=bar(3,mean(cp_s3)),

b1.FaceColor = [0.6350 0.6350 0.6350];
b2.FaceColor = [0.8500 0.3250 0.0980];
b3.FaceColor = [0 0.4470 0.7410];

b1.EdgeColor = [0 0 0];
b2.EdgeColor = [0 0 0];
b3.EdgeColor = [0 0 0];

b1.LineWidth=1.5;
b2.LineWidth=1.5;
b3.LineWidth=1.5;

e1=errorbar(1,mean(cp_s1),SEM_s1),
e2=errorbar(2,mean(cp_s2),SEM_s2),
e3=errorbar(3,mean(cp_s3),SEM_s3),

e1.Color=[0 0 0];
e2.Color=[0 0 0];
e3.Color=[0 0 0];

e1.LineWidth=2;
e2.LineWidth=2;
e3.LineWidth=2;

xticks([1 2 3]),xticklabels({'s1','s2','s3'}),
title(['p1=',num2str(p1),'p2=',num2str(p2),'p3=',num2str(p3)])
set(gca,'fontsize', 20),
set(gca,'linewidth',2),
%%
dc=zeros(length(cp_208_regr),1);
dc(idx_s1)=1;
dc(idx_s2)=2;
dc(idx_s3)=3;

[B,dev,stats] = mnrfit(cp_208_regr,dc,'model','ordinal')
stats.p(end)

%%
ax=subplot(432),
[r2,p2]=corr(cp_s2,suvr_s2,'rows','pairwise','type','spearman'),%,'type','spearman'
plot(cp_s2,suvr_s2,'.','MarkerSize',30,'MarkerEdgeColor',[0.8500 0.3250 0.0980]),
title(['r2=',num2str(r2),'  p2=',num2str(p2)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(434),
[r2,p2]=corr(cp_s2,csf_abeta_s2,'rows','pairwise','type','spearman'),%
plot(cp_s2,csf_abeta_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),
title(['r2=',num2str(r2),'  p2=',num2str(p2)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(435),
[r2,p2]=corr(cp_s2,csf_ttau_s2,'rows','pairwise','type','spearman'),%
plot(cp_s2,csf_ttau_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),
title(['r2=',num2str(r2),'  p2=',num2str(p2)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,


ax=subplot(436),
[r2,p2]=corr(cp_s2,csf_ptau_s2,'rows','pairwise','type','spearman'),
plot(cp_s2,csf_ptau_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),
title(['r2=',num2str(r2),'  p2=',num2str(p2)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,



%%
longi=load('mats/test_regr_motion_2.mat','cp_s2','suvr_longi_s2','id_subj_early2','idx_s2')

ax=subplot(433),
[r2,p2]=corr(longi.cp_s2,longi.suvr_longi_s2,'rows','pairwise','type','spearman'),
plot(longi.cp_s2,longi.suvr_longi_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),
title(['r2=',num2str(r2),'  p2=',num2str(p2)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4]),%ylim([-0.02 0.08])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,
%%
load('mats/test_regr_motion_3.mat','id_subj_early2_s2','tmp*')

[r12_tmp,p12_tmp]=corr((tmp1),(tmp2),'rows','pairwise','type','spearman'),%palm_inormal%
[r12_tmp2,p12_tmp2]=corr((tmp3),(tmp4),'rows','pairwise','type','spearman'),%

ax=subplot(437),
plot(tmp1,tmp2,'.','MarkerSize',30,'MarkerEdgeColor',[1 0.0 0.0]), %
title(['r=',num2str(r12_tmp),'p=',num2str(p12_tmp)]),yticks([0 0.04 0.08]),xlim([-0.5 .2])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(438),
plot(tmp3,tmp4,'.','MarkerSize',30,'MarkerEdgeColor',[0 0 1]), 
title(['r=',num2str(r12_tmp2),'p=',num2str(p12_tmp2)]),yticks([-0.03 0 0.03 0.06]),xlim([-0.5 .2])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,ylim([-0.02 0.06])
%% fig3

load('mats/test_regr_motion_4.mat','r_test2_s2_regr','longi_pet_diff_sj_E_s2','id_subj_s2_19')

ax=subplot(439),
[r2,p2]=corr(longi_pet_diff_sj_E_s2,(r_test2_s2_regr),'rows','pairwise','type','spearman')%
plot(longi_pet_diff_sj_E_s2,(r_test2_s2_regr'),'.','MarkerSize',30,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
title(['r=',num2str(r2),'p=',num2str(p2)])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,
%%
load('mats/fig4_regr_motion.mat','id_tmp22','csf_abeta_s2','fc_dmn_gs_s2','fc_dmn_gsr_s2','fc_sm_gs_s2','fc_sm_gsr_s2','fc_sm_dmn_gs_s2','fc_sm_dmn_gsr_s2')

ax=subplot(4,3,10),
[r2,p2]=corr((csf_abeta_s2),(fc_dmn_gs_s2),'rows','pairwise','type','spearman'),%,'type','spearman'%%palm_inormal
plot(csf_abeta_s2,fc_dmn_gs_s2,'.','MarkerSize',30,'Color',[1 0 0]),

h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';

hold on,
[r2,p2]=corr((csf_abeta_s2),fc_dmn_gsr_s2,'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_dmn_gsr_s2,'o','MarkerSize',8,'Color',[1, 0, 0, 0.1]),
lsline,

set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,



%% test 4


ax=subplot(4,3,11),
[r2,p2]=corr((csf_abeta_s2),(fc_sm_gs_s2),'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_gs_s2,'.','MarkerSize',30,'Color',[0 0 .9]),

h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';

hold on,
[r2,p2]=corr((csf_abeta_s2),fc_sm_gsr_s2,'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_gsr_s2,'o','MarkerSize',8,'Color',[0, 0, 0.9]),
lsline,

set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,


%% test 5


ax=subplot(4,3,12),
[r2,p2]=corr((csf_abeta_s2),(fc_sm_dmn_gs_s2),'rows','pairwise','type','spearman'),%,'type','spearman'%%palm_inormal
plot(csf_abeta_s2,fc_sm_dmn_gs_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),

h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';

hold on,
[r2,p2]=corr((csf_abeta_s2),fc_sm_dmn_gsr_s2,'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_dmn_gsr_s2,'o','MarkerSize',8,'Color',[0.8500 0.3250 0.0980]),
lsline,

set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,
