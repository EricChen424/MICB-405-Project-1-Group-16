# MICB-405-Project-1-Group-16
Useful commands:

pscp echen_mb18@orca-wg.bcgsc.ca:/home/echen_mb18/Project_1/1_FastQC_Output/*.html E:\Users\Desktop\MICB405_Dump

pscp * echen_mb18@orca-wg.bcgsc.ca:/home/echen_mb18/scripts

After uploading a shell script to your server, be sure to call chmod 744 on it to give it execute permissions

If you get complaints with shell scripts about a bad interpreter with a ^M at the end, follow this page:
https://stackoverflow.com/questions/2920416/configure-bin-shm-bad-interpreter

ie. Open your script with vim, type :set fileformat=unix, hit Enter, then save with :wq
