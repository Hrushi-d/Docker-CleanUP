# Docker CleanUP

This repository contains a simple Bash script that automates the cleanup of unused Docker resources, including images, networks, and volumes, on multiple application servers. With its straightforward implementation and seamless integration with Jenkins, it ensures a streamlined approach to maintaining Docker environments.

## Prerequisites

Before running the script, ensure that you have the following prerequisites:

- A Jenkins server set up and running
- SSH access to the remote application servers from the Jenkins server
- SSH private key (`~/.ssh/id_rsa`) with necessary permissions to connect to the remote servers
- Remote user account credentials with passwordless SSH access
- Script is already present in the `~/scripts` directory on the Jenkins server.

## Getting Started

Follow these steps to set up and run the Docker cleanup script:

1. Make sure you have the `cleandocker.sh` script in the `~/scripts` directory on your Jenkins server.

2. In your Jenkins job, set a choice parameter named `REMOTE_SERVER_IP` with the IP addresses of the remote application servers you want to target.

3. In the Jenkins job's executable shell, use the following command:

   ```bash
   scp -i ~/.ssh/id_rsa -v ~/scripts/cleandocker.sh remoteuser@$REMOTE_SERVER_IP:/tmp && ssh -i ~/.ssh/id_rsa -v remoteuser@$REMOTE_SERVER_IP 'bash /tmp/cleandocker.sh'
   

Replace `remoteuser` with the actual username you use to connect to the remote application server. It is assumed the script is already available in the `~/scripts` directory.

**Note:** This command assumes you have passwordless SSH access to the remote server using your SSH private key. If you need to enter a password, modify the command accordingly or consider using an SSH agent or other secure methods for password management.

## Script Actions
The script will perform the following actions on the remote server:
- Remove all unused Docker images
- Remove all unused Docker networks
- Remove all unused Docker volumes

You should see the output of the script in the console, indicating the progress and completion of the cleanup process.

## Script Details
The `cleandocker.sh` script contains the following commands:
- `docker image prune -a --force`: This command removes all unused Docker images, including dangling images (images that are not associated with any container). The `-a` flag removes all unused images, not just dangling ones, and the `--force` flag skips the confirmation prompt.
- `docker network prune --force`: This command removes all unused Docker networks. The `--force` flag skips the confirmation prompt.
- `docker volume prune --force`: This command removes all unused Docker volumes. The `--force` flag skips the confirmation prompt.

If any of the commands fail, an error message is printed to the console.

## Key Points
- Set up the choice parameter `REMOTE_SERVER_IP` in the Jenkins job to specify the IP addresses of the target servers.
- Use the command to copy the `cleandocker.sh` script to the remote server and execute it, using the `$REMOTE_SERVER_IP` variable.
- Store the script temporarily on the remote server in `/tmp`.
- Use this single job to clean up all the application servers' unused Docker resources.

## Contact Us 📧

Have questions, feedback, or need assistance? Reach out to:

Email: hrushikeshdagwar@gmail.com
