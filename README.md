## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Image](Images/Red_Team_Elk_Network_Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the yml file may be used to install only certain pieces of it, such as Filebeat.

- [Playbook_YML](Playbook_YML)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic inbound to the network.
- Load balancers help to protect the network from DDoS attacks by distributing incoming traffic across a group of backend servers. The main advantage of implementing a jumpbox is being able to have instant and secure access to network and applications.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network logs and system metrics.
- Filebeat monitors log files and specified locations. It then forwards the collected data to Elasticsearch to be indexed.
- Metricbeat records the networks system metrics

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box |Gateway   | 10.0.0.4   | Linux            |
| Web-1    |Web server| 10.0.0.5   | Linux            |
| Web-2    |Web server| 10.0.0.6   | Linux            |
| Web-3    |Web server| 10.0.0.7   | Linux            |
| ELK      |Monitoring| 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Personal IP

Machines within the network can only be accessed by Jumpbox.
- The Jumpbox (10.0.0.4) also has access to the ELK VM.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | No                  | Personal IP          |
| Web-1    | No                  | 10.0.0.4             |
| Web-2    | No                  | 10.0.0.4             |
| Web-3    | No                  | 10.0.0.4             |
| Elk      | No                  | Personal IP and 10.1.0.4|

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because ansible is simple to set up and use. The automatic configuration helps to reduce errors during installation and updates and the playbooks can be used to set up or update multiple machines at once.

The playbook implements the following tasks:
- Installs docker.io
- installs python3-pip
- installs docker module
- increases virtual memory
- Downloads and launches a docker elk container.
- Enables docker service on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Image](Images/sdodkrps.JPG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1  10.0.0.5
- Web-2  10.0.0.6
- Web-3  10.0.0.7

We have installed the following Beats on these machines:
- Filebeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects the data from log files which is then forwarded to Elasticsearch to be indexed.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the .yml files to /etc/ansible/roles.
- Update the hosts file to include the private IPs of the webservers and elk server
- Run the playbook, and navigate to http://<ELK.VM.External.IP>:5601/app/kibana to check that the installation worked as expected.

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
