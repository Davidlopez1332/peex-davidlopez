# After launch 

SSH in to the instance and execute following commands to mount EFS files:

- $sudo yum -y update  
- $  sudo reboot  
- $ sudo yum -y install nfs-utils
- $ mkdir ~/efs-mount-point 
- $ sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport mount-target-DNS:/   ~/efs-mount-point  
- $ sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport mount-target-ip:/  ~/efs-mount-point
- $ cd ~/efs-mount-point  
- $ ls -al
- $ sudo chmod go+rw .
- $ touch test-file.txt 
- $ ls -l

further instructions at: https://docs.aws.amazon.com/efs/latest/ug/wt1-test.html