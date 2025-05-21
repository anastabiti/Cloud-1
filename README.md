# Cloud Infrastructure Automation Project

This project provides an automated solution for deploying WordPress with Nginx and MariaDB on AWS EC2 instances using Ansible and Docker. The infrastructure is managed as code, allowing for consistent, repeatable deployments.

## 🚀 Features

- **Infrastructure as Code**: Provision EC2 instances on AWS automatically
- **Containerized Architecture**: Docker-based deployment with three containers:
  - Nginx (web server with SSL termination)
  - WordPress (PHP-FPM)
  - MariaDB (database)
- **Fully Automated**: Complete end-to-end deployment with Ansible
- **Secure by Default**: HTTPS configuration with self-signed certificates
- **Persistent Storage**: Data volumes for WordPress and MariaDB

## 📁 Project Structure

```
.
├── Controlnode/         # Ansible control node files
├── create_ec2/          # EC2 instance creation playbooks
└── srcs/                # Source files for Docker containers
    ├── .env             # Environment variables
    ├── docker-compose.yml
    └── requirements/
        ├── nginx/       # Nginx configuration
        ├── wordpress/   # WordPress configuration
        └── mariadb/     # MariaDB configuration
```

## 🛠️ Prerequisites

- AWS Account with appropriate permissions
- AWS CLI configured with access and secret keys
- Ansible installed on control machine
- Docker and Docker Compose knowledge
- SSH key pair for EC2 access

## 🚀 Deployment Steps

### 1. EC2 Instance Creation

```bash
cd create_ec2
ansible-playbook create_ec2.yml
```

This playbook:
- Creates an EC2 instance on AWS
- Registers the new instance's IP in the inventory
- Waits for SSH to be available

### 2. Infrastructure Setup

```bash
cd ../Controlnode
ansible-playbook -i hosts playbook.yml
```

This playbook:
- Installs Docker and dependencies
- Sets up the infrastructure components
- Deploys the containers using docker-compose

## 🔧 Configuration

### Environment Variables

Key environment variables (stored in `.env`):
- `MARIADB_DATABASE`: Database name
- `MARIADB_USER`: Database user
- `MARIADB_PASSWORD`: Database password
- `MYSQL_HOST`: Database host
- `WORDPRESS_ADMIN`: WordPress admin username
- `WORDPRESS_PASSWORD_ADMIN`: WordPress admin password
- `WORDPRESS_USER`: Additional WordPress user
- `WORDPRESS_PASSWORD`: Password for additional user
- `ADMIN_WP_EMAIL`: Admin email address

### AWS Configuration

The EC2 instance deployment uses the following parameters (defined in `vars.yml`):
- AWS region
- Instance type
- Security group
- AMI ID
- Key name

## 🌐 Accessing the Application

Once deployed, WordPress will be accessible at:
- HTTPS: `https://<EC2-PUBLIC-IP>/`
- HTTP redirects to HTTPS automatically

## 📝 Notes

- The Nginx configuration automatically redirects HTTP traffic to HTTPS
- Self-signed SSL certificates are generated during deployment
- WordPress is configured to work with the server's public IP
- Data persistence is maintained through Docker volumes

