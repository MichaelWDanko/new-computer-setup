#!/bin/zsh

# Get the current date in YYYY-MM-DD format
current_date=$(date +%Y-%m-%d)

# Set the output file to be saved on the Desktop
output_file="$HOME/Desktop/Applications_${current_date}.md"

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

# Log completion with ASCII art
echo ""
echo "============================================="
echo "🎉  The markdown file has been created! 🎉"
echo "   Saved to your Desktop as:"
echo "   $output_file"
echo "============================================="
echo "      _.-'''''-._        "
echo "    .'  _     _  '.      "
echo "   /   (o)   (o)   \     "
echo "  |                 |    "
echo "  |  \           /  |    "
echo "   \  '.       .'  /     "
echo "   '.    '---'  .'       "
echo "      '-._____.-'        "
echo "============================================="