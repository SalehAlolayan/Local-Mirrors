#!/bin/bash
repos_base_dir="/repos/centos/8-stream/"

# Start sync if base repo directory exist
if [[ -d "$repos_base_dir" ]] ; then
  # Start Sync
  rsync  -avSHP --delete --exclude 'isos' rsync://MIRROR_URL/centos/8-stream/  "$repos_base_dir" 
  #As a backup if the first one fails
  rsync  -avSHP --delete --exclude 'isos' rsync://MIRROR_URL/centos/8-stream/  "$repos_base_dir"  
  # Download CentOS 8 repository key
  wget -O /repos/centos/8-stream/RPM-GPG-KEY-CentOS-Official https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Official
fi
date >> /repos/centos8-stream-sync-time.txt
