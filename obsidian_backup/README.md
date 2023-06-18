# Introduction

- small utility to sync Obsidian vaults to Gdrive and vice versa
- checks if there is internet connection and then performs the sync

# Usage

- command `of2g` -> sync from the local computer to Gdrive
- command `og2f` -> sync from Gdrive to the local computer

# Flags

- `c` flag synchronizes only the ComTech vault
- `l` flag synchronizes only the Learning vault
- `w` flag synchronizes only the Work vault

> Note: Using the commands without any flag synchronizes all Obsidian vaults.

# Dependencies

- `wget` for checking the internet connection
- `rclone` for performing the synchronization
