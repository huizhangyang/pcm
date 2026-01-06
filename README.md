# Principal Component Maximization (PCM)
Matlab program for the PCM algorithm for SAR image formation from raw data.

Paper:
Huizhang Yang et al. Principal Component Maximization: A Novel Method for SAR Image Recovery from Raw Data without System Parameters, IEEE TIP, 2026.

Please contact Huizhang Yang if you have any questions.
Email: hzyang@njust.edu.cn

Raw data:  https://pan.baidu.com/s/1RIcTl1nNCbonK-avohBi8g?pwd=u2sh

Usage:
load data.mat
opt.block_len = [800 1600];
I = pcm_fcs(data,opt);
figure
plot_sar(I,99); 
I = abs(I);
th = prctile(I(:),98);
imwrite(imresize(min(I,th)/th,[6000 2000]),'result.jpg')
![test2](https://github.com/user-attachments/assets/2a8de023-ec7d-4d6e-86d3-92f4fecf3daa)


