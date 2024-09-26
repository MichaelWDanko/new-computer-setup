#!/bin/zsh

# Get the current date in YYYY-MM-DD format
current_date=$(date +%Y-%m-%d)

# Set the output file with the date in the name
output_file="Applications_${current_date}.md"

# Header for the markdown file
echo "# Installed Applications on macOS" > $output_file
echo "" >> $output_file

# Function to list applications
list_apps() {
    local directory=$1
    echo "## Applications in $directory" >> $output_file
    echo "" >> $output_file
    for app in "$directory"/*.app; do
        if [ -d "$app" ]; then
            app_name=$(basename "$app" .app)
            echo "- $app_name" >> $output_file
        fi
    done
    echo "" >> $output_file
}

# List applications in system-wide and user directories
list_apps "/Applications"
list_apps "$HOME/Applications"

# Notify the user
echo "Markdown file generated: $output_file"
