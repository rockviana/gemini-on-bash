# Gemini Script Documentation

The Gemini Script offers a streamlined way to interact with the Google Generative AI API. It allows users to effortlessly set up a Python virtual environment, install necessary dependencies, execute tailored Python scripts with straightforward commands, and thoroughly remove the installation when no longer needed.

## Requirements

- Python 3.6 or newer
- Internet access for dependency installation
- A valid API key for Google Generative AI

## Generating an API Key

1. Navigate to [Google AI Studio](https://aistudio.google.com/app/prompts/new_chat) or the specific API management webpage.
2. If prompted, sign in with your Google account.
3. Proceed to create a new project or select an existing one.
4. Find and select the option to generate new credentials or API keys.
5. Complete the process to generate a new API key, adhering to any security measures suggested, like key restrictions.
6. Safely store the generated API key for later use in the script.

## Installation

1. Download or clone the `gemini.sh` script to your local system.
2. Open your terminal and change directory (`cd`) to where `gemini.sh` is located.
3. Execute the script with the install command:
   ```bash
   bash gemini.sh install
   ```
   This command will set up the virtual environment, install all necessary dependencies, create the Python script, move `gemini.sh` to `~/gemini`, and add a convenient alias to your `.bashrc`.

4. To activate the alias, either start a new terminal session or reload your `.bashrc`:
   ```bash
   source ~/.bashrc
   ```

## Usage

With the installation complete, you can use the `gemini` alias to run the configured Python script. Basic syntax is as follows:
```bash
gemini "your_prompt_here"
```
Replace `"your_prompt_here"` with the actual prompt you wish to send to the Google Generative AI API.

## Updating

For updates, simply re-run the installation command. This will overwrite the current installation with the updated script and dependencies.

## Removal

To remove the Gemini Script and its configurations from your system, execute:
```bash
bash ~/gemini/gemini.sh uninstall
```
This removes the virtual environment, the Python script, and cleans up the `.bashrc` alias, effectively undoing all changes made by the installation script.

## Additional Notes

- Remember to replace `'your_api_key'` with your actual Google Generative AI API key in the Python script setup during the installation process.
- If any issues arise during installation or use, ensure all prerequisites are correctly installed and configured on your system.
