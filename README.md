# Pterodactyl Node VPS Optimizer

## Supported Operating Systems and PHP Versions

| Operating System | Version | Supported | PHP Version |
|------------------|---------|-----------|-------------|
| **Ubuntu**        | 14.04   | 🔴         |             |
|                  | 16.04   | 🔴 *       |             |
|                  | 18.04   | 🔴 *       | 8.1         |
|                  | 20.04   | ✅         | 8.1         |
|                  | 22.04   | ✅         | 8.1         |
|                  | 24.04   | ✅         | 8.1         |
| **Debian**        | 8       | 🔴 *       |             |
|                  | 9       | 🔴 *       |             |
|                  | 10      | ✅         | 8.1         |
|                  | 11      | ✅         | 8.1         |
|                  | 12      | ✅         | 8.1         |
| **CentOS**        | 6       | 🔴         |             |
|                  | 7       | 🔴 *       |             |
|                  | 8       | 🔴 *       |             |
| **Rocky Linux**   | 8       | ✅         | 8.1         |
|                  | 9       | ✅         | 8.1         |
| **AlmaLinux**     | 8       | ✅         | 8.1         |
|                  | 9       | ✅         | 8.1         |

### Key:

- ✅ – Fully Supported
- 🔴 – Not Supported
- 🔴 * – End of life or limited support

## Installation and Usage

To download and execute the optimization script, simply run the following command in your terminal:

```bash
bash -c "$(curl -s https://raw.githubusercontent.com/AndrewONN/Pterodactyl-Node-Vps-Optimiser/main/optimize_vps.sh)"
```

### Access Key

Copy the key from here to proceed with the script:

```bash
andrewopt
```

## Overview

The **Pterodactyl Node VPS Optimizer** is a shell script designed to enhance the performance and efficiency of your Pterodactyl Node VPS. This script optimizes various system parameters related to network performance, CPU usage, and memory management. By applying these optimizations, users can achieve improved performance for their Pterodactyl game servers.

## Features

- **Comprehensive System Updates**: Ensures your system is up-to-date with the latest security patches and performance enhancements.
- **Swap File Management**: Creates and configures a swap file for better memory management, allowing for smoother server operation.
- **Network Optimization**: Configures system parameters for optimal TCP performance, including settings for congestion control, buffer sizes, and connection limits.
- **CPU Performance Tuning**: Allows you to set the CPU governor for better performance and manages CPU frequency scaling for efficient resource utilization.
- **Easy Installation and Uninstallation**: Simple menu-driven interface for installing and uninstalling optimizations with a single command.
- **Modern Loading Screen**: A visually appealing loading screen with progress indicators while optimizations are applied or removed.
- **Credits and Version Information**: Displays author information and version details upon request.
