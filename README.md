# .config-nvim
# Neovim configuration
### Installing Neovim
1. Install the required dependencies:
   ```
   sudo apt-get update
   sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
   ```

2. Clone the Neovim repository:
   ```
   git clone https://github.com/neovim/neovim.git
   ```

3. Enter the Neovim directory:
   ```
   cd neovim
   ```

4. Build Neovim using CMake:
   ```
   make CMAKE_BUILD_TYPE=Release
   ```

5. Install Neovim system-wide:
   ```
   sudo make install
   ```

6. Verify the installation:
   ```
   nvim --version
   ```

   This command should display the version information of Neovim if the installation was successful.

That's it! You have installed Neovim from source on your Ubuntu system. You can now use the `nvim` command to launch Neovim and start editing files.


