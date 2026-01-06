# pcm
Matlab program for the PCM algorithm for SAR image formation from raw data.

Paper:
Huizhang Yang et al. Principal Component Maximization: A Novel Method for SAR Image Recovery from Raw Data without System Parameters, IEEE TIP, 2026.

Please contact Huizhang Yang if you have any questions.
Email: hzyang@njust.edu.cn

Usage:
load data.mat
opt.block_len = [800 1600];
I = pcm_fcs(data,opt);
figure
plot_sar(I,99); 

![test2](https://github.com/user-attachments/assets/eb6ae006-3124-4919-b1f3-394edf9202be)


