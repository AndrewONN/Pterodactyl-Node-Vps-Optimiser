#!/bin/bash

# Overview: This script optimizes network performance, CPU performance, and memory management on a VPS.
# Version: 1.0
# Made by AndrewON
# Title: Enhanced Pterodactyl Node VPS Optimization

# Function to check the success of commands
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error occurred while executing: $1"
        return 1
    fi
    return 0
}

# Function to display a loading screen
display_loading() {
    echo -e "\n\033[1;36mCreated By AndrewON\033[0m"  # Cyan color for loading message
    for i in {0..10}; do
        sleep 1  # Simulating time taken for each step
        percentage=$((i * 10))
        loading_bar=$(printf '%*s' "$i" '' | tr ' ' '●')  # Loading dots
        empty_space=$(printf '%*s' $((10 - i)) '' | tr ' ' '○')  # Empty dots
        case $i in
            0) color="\033[1;32m" ;; # Green for the start
            1) color="\033[1;32m" ;; # Green
            2) color="\033[1;33m" ;; # Yellow for 30%
            3) color="\033[1;33m" ;; # Yellow
            4) color="\033[1;32m" ;; # Green for 50%
            5) color="\033[1;36m" ;; # Cyan for 60%
            6) color="\033[1;36m" ;; # Cyan
            7) color="\033[1;35m" ;; # Magenta for 70%
            8) color="\033[1;35m" ;; # Magenta
            9) color="\033[1;37m" ;; # White for 90%
            10) color="\033[1;32m" ;; # Green for 100%
        esac
        printf "\r${color}${loading_bar}${empty_space} ${percentage}%%"
    done
    echo -e "\n\033[1;32mOperation completed successfully!\033[0m"  # Green for completion
}

# Function to uninstall optimizations
uninstall_optimizations() {
    echo -e "\n\033[1;33mUninstalling optimizations...\033[0m"  # Yellow color for uninstallation messages
    echo -e "\033[1;36mUnoptimizing...\033[0m"  # Show unoptimizing in loading
    display_loading  # Show loading during uninstallation

    # Remove swap file
    if [ -f /swapfile ]; then
        sudo swapoff /swapfile
        sudo rm /swapfile
        echo "Swap file removed."
    fi

    # Remove sysctl settings
    echo -e "\033[1;33mRemoving sysctl settings...\033[0m"
    sudo sed -i '/^net.ipv4.tcp_window_scaling/d' /etc/sysctl.conf
    sudo sed -i '/^net.ipv4.tcp_rmem/d' /etc/sysctl.conf
    sudo sed -i '/^net.ipv4.tcp_wmem/d' /etc/sysctl.conf
    sudo sed -i '/^net.ipv4.tcp_fastopen/d' /etc/sysctl.conf
    sudo sed -i '/^fs.file-max/d' /etc/sysctl.conf
    sudo sed -i '/^net.core.somaxconn/d' /etc/sysctl.conf
    sudo sed -i '/^net.core.netdev_max_backlog/d' /etc/sysctl.conf
    sudo sed -i '/^net.ipv4.tcp_fin_timeout/d' /etc/sysctl.conf
    sudo sed -i '/^net.ipv4.tcp_congestion_control/d' /etc/sysctl.conf
    sudo sed -i '/^net.ipv4.tcp_timestamps/d' /etc/sysctl.conf
    sudo sed -i '/^vm.swappiness/d' /etc/sysctl.conf
    sudo sed -i '/^fs.file-max/d' /etc/sysctl.conf
    sudo sed -i '/^kernel.pid_max/d' /etc/sysctl.conf
    sudo sed -i '/^kernel.sched_migration_cost_ns/d' /etc/sysctl.conf
    sudo sed -i '/^kernel.sched_wakeup_granularity_ns/d' /etc/sysctl.conf
    sudo sed -i '/^kernel.sched_rt_runtime_us/d' /etc/sysctl.conf
    sudo sed -i '/^vm.dirty_background_ratio/d' /etc/sysctl.conf
    sudo sed -i '/^vm.dirty_ratio/d' /etc/sysctl.conf
    sudo sed -i '/^vm.min_free_kbytes/d' /etc/sysctl.conf

    echo "Sysctl settings removed. Applying changes..."
    sudo sysctl -p
    echo -e "\033[1;33mUninstallation of optimizations completed successfully.\033[0m"
}

# Main script execution
optimization_key_set=false

while true; do
    # Display logo
    echo -e "\033[1;34m========================================\033[0m"
    echo -e "\033[1;34m     Pterodactyl Node VPS Optimization  \033[0m"
    echo -e "\033[1;34m========================================\033[0m"

    # Prompt for the key if not set
    if ! $optimization_key_set; then
        read -p "Enter the optimization key: " key
        if [[ "$key" != "andrewopt" ]]; then
            echo -e "\033[1;31mInvalid key. Exiting.\033[0m"  # Red for invalid key
            exit 1
        fi
        optimization_key_set=true  # Set the key once it's validated
    fi

    # Prompt for action
    echo -e "\n\033[1;32mChoose an option:\033[0m"  # Green color for options
    echo "1. Install optimizations"
    echo "2. Uninstall optimizations"
    echo "3. Credits"
    echo "4. Exit"
    read -p "Enter your choice (1, 2, 3, or 4): " choice

    if [[ "$choice" == "1" ]]; then
        # Start optimization
        echo -e "\n\033[1;36mUpdating the system...\033[0m"  # Cyan color for updates
        sudo apt update && sudo apt full-upgrade -y
        check_command "System update"
        echo -e "\033[1;36mInstalling optimizations...\033[0m"  # Show installation message
        display_loading  # Show loading during installation

        # Create and configure swap file
        echo -e "\033[1;36mCreating and configuring swap file...\033[0m"
        sudo fallocate -l 40G /swapfile
        check_command "Creating swap file"
        sudo chmod 600 /swapfile
        sudo mkswap /swapfile
        sudo swapon /swapfile
        echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
        check_command "Configuring swap file"

        # Configure sysctl settings for network optimization
        echo -e "\033[1;36mConfiguring sysctl settings for network optimization...\033[0m"
        {
            echo "net.ipv4.tcp_window_scaling = 1"
            echo "net.ipv4.tcp_rmem = 4096 87380 6291456"
            echo "net.ipv4.tcp_wmem = 4096 87380 6291456"
            echo "net.ipv4.tcp_fastopen = 3"
            echo "fs.file-max = 2097152"
            echo "net.core.somaxconn = 1024"
            echo "net.core.netdev_max_backlog = 5000"
            echo "net.ipv4.tcp_fin_timeout = 15"
            echo "net.ipv4.tcp_congestion_control = bbr"
            echo "net.ipv4.tcp_timestamps = 0"
            echo "vm.swappiness = 10"
            echo "fs.file-max = 100000"
            echo "kernel.pid_max = 4194303"
            echo "kernel.sched_migration_cost_ns = 500000"
            echo "kernel.sched_wakeup_granularity_ns = 15000000"
            echo "kernel.sched_rt_runtime_us = -1"
            echo "vm.dirty_background_ratio = 5"
            echo "vm.dirty_ratio = 10"
            echo "vm.min_free_kbytes = 65536"
        } | sudo tee -a /etc/sysctl.conf
        check_command "Configuring sysctl settings"

        # Apply sysctl settings
        echo -e "\033[1;36mApplying sysctl settings...\033[0m"
        sudo sysctl -p
        check_command "Applying sysctl settings"

        echo -e "\n\033[1;32mOptimization completed successfully!\033[0m"  # Green for completion

    elif [[ "$choice" == "2" ]]; then
        # Start uninstallation
        uninstall_optimizations

    elif [[ "$choice" == "3" ]]; then
        # Show credits
        echo -e "\n\033[1;33mMade by AndrewON\033[0m"
        echo -e "\033[1;33mVersion: 1.0\033[0m"
        echo -e "\033[1;33mPterodactyl Node VPS Optimizations\033[0m"

    elif [[ "$choice" == "4" ]]; then
        # Exit
        echo -e "\033[1;32mExiting... Thank you!\033[0m"  # Green for exit message
        exit 0

    else
        echo -e "\033[1;31mInvalid choice. Please enter a valid option.\033[0m"  # Red for invalid choice
    fi

    # Loop to prevent exit
    while true; do
        echo -e "\n\033[1;32mChoose an option:\033[0m"  # Green color for options
        echo "1. Install optimizations"
        echo "2. Uninstall optimizations"
        echo "3. Credits"
        echo "4. Exit"
        read -p "Enter your choice (1, 2, 3, or 4): " choice

        if [[ "$choice" == "1" ]]; then
            # Start optimization
            echo -e "\n\033[1;36mUpdating the system...\033[0m"  # Cyan color for updates
            sudo apt update && sudo apt full-upgrade -y
            check_command "System update"
            echo -e "\033[1;36mInstalling optimizations...\033[0m"  # Show installation message
            display_loading  # Show loading during installation

            # Create and configure swap file
            echo -e "\033[1;36mCreating and configuring swap file...\033[0m"
            sudo fallocate -l 40G /swapfile
            check_command "Creating swap file"
            sudo chmod 600 /swapfile
            sudo mkswap /swapfile
            sudo swapon /swapfile
            echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
            check_command "Configuring swap file"

            # Configure sysctl settings for network optimization
            echo -e "\033[1;36mConfiguring sysctl settings for network optimization...\033[0m"
            {
                echo "net.ipv4.tcp_window_scaling = 1"
                echo "net.ipv4.tcp_rmem = 4096 87380 6291456"
                echo "net.ipv4.tcp_wmem = 4096 87380 6291456"
                echo "net.ipv4.tcp_fastopen = 3"
                echo "fs.file-max = 2097152"
                echo "net.core.somaxconn = 1024"
                echo "net.core.netdev_max_backlog = 5000"
                echo "net.ipv4.tcp_fin_timeout = 15"
                echo "net.ipv4.tcp_congestion_control = bbr"
                echo "net.ipv4.tcp_timestamps = 0"
                echo "vm.swappiness = 10"
                echo "fs.file-max = 100000"
                echo "kernel.pid_max = 4194303"
                echo "kernel.sched_migration_cost_ns = 500000"
                echo "kernel.sched_wakeup_granularity_ns = 15000000"
                echo "kernel.sched_rt_runtime_us = -1"
                echo "vm.dirty_background_ratio = 5"
                echo "vm.dirty_ratio = 10"
                echo "vm.min_free_kbytes = 65536"
            } | sudo tee -a /etc/sysctl.conf
            check_command "Configuring sysctl settings"

            # Apply sysctl settings
            echo -e "\033[1;36mApplying sysctl settings...\033[0m"
            sudo sysctl -p
            check_command "Applying sysctl settings"

            echo -e "\n\033[1;32mOptimization completed successfully!\033[0m"  # Green for completion

        elif [[ "$choice" == "2" ]]; then
            # Start uninstallation
            uninstall_optimizations

        elif [[ "$choice" == "3" ]]; then
            # Show credits
            echo -e "\n\033[1;33mMade by AndrewON\033[0m"
            echo -e "\033[1;33mVersion: 1.0\033[0m"
            echo -e "\033[1;33mPterodactyl Node VPS Optimizations\033[0m"

        elif [[ "$choice" == "4" ]]; then
            # Exit
            echo -e "\033[1;32mExiting... Thank you!\033[0m"  # Green for exit message
            exit 0

        else
            echo -e "\033[1;31mInvalid choice. Please enter a valid option.\033[0m"  # Red for invalid choice
        fi
    done
done