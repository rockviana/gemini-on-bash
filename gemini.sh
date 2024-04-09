#!/bin/bash

GEMINI_HOME="$HOME/gemini"
VENV_DIR="$GEMINI_HOME/venv"
PACKAGE_NAME="google-generativeai"
PYTHON_SCRIPT="$GEMINI_HOME/gemini.py"
ALIAS_NAME="gemini"
ALIAS_COMMAND="bash $GEMINI_HOME/gemini.sh"
ACTION="$1"

setup_environment() {
    echo "Creating directory $GEMINI_HOME..."
    mkdir -p "$GEMINI_HOME"
    echo "Creating virtual environment in $VENV_DIR..."
    python3 -m venv "$VENV_DIR"
    source "$VENV_DIR/bin/activate"
    echo "Installing package $PACKAGE_NAME..."
    pip install "$PACKAGE_NAME"
    deactivate
}

configure_scripts() {
    echo "Creating the Python script in $PYTHON_SCRIPT..."
    cat > "$PYTHON_SCRIPT" <<EOF
import sys
import google.generativeai as genai

def process_parameter(parameter):
    # Replace 'your_api_key' with your actual API key
    genai.configure(api_key='your_api_key')
    model = genai.GenerativeModel('gemini-pro')
    response = model.generate_content(parameter)
    return response.text

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 gemini.py <parameter>")
        sys.exit(1)
    parameter = ' '.join(sys.argv[1:])
    result = process_parameter(parameter)
    print(result)
EOF
    chmod +x "$PYTHON_SCRIPT"

    echo "Moving gemini.sh to $GEMINI_HOME..."
    mv "$0" "$GEMINI_HOME/gemini.sh"
}

add_alias() {
    if ! grep -q "alias $ALIAS_NAME=" ~/.bashrc; then
        echo "alias $ALIAS_NAME='$ALIAS_COMMAND'" >> ~/.bashrc
        echo "Alias '$ALIAS_NAME' added to ~/.bashrc. Please, restart the terminal or reload with 'source ~/.bashrc'."
    else
        echo "Alias '$ALIAS_NAME' already exists in .bashrc."
    fi
}

uninstall() {
    echo "Removing $GEMINI_HOME and related clean-ups..."
    rm -rf "$GEMINI_HOME"
    sed -i "/alias $ALIAS_NAME=/d" ~/.bashrc
    echo "Uninstallation complete. Please, reload .bashrc."
}

case "$ACTION" in
    install)
        setup_environment
        configure_scripts
        add_alias
        echo "Installation completed. Please, restart the terminal or reload with 'source ~/.bashrc'."
        ;;
    uninstall)
        uninstall
        ;;
    *)
        echo "Invalid action. Usage: bash $GEMINI_HOME/gemini.sh [install|uninstall]"
        exit 1
        ;;
esac
