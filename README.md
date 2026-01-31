# Principal Component Maximization (PCM)
Matlab program of the PCM algorithm for parameter-free image formation from SAR raw data.

Paper:
Huizhang Yang et al. Principal Component Maximization: A Novel Method for SAR Image Recovery from Raw Data without System Parameters, IEEE TIP, 2026. https://ieeexplore.ieee.org/document/11367386

Please contact Huizhang Yang if you need the source code of pcm_fcs.p or have any questions.
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

![result](https://github.com/user-attachments/assets/31d6c30f-b35c-460d-bdea-857a35111b89)
