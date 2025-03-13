import os
import subprocess

# Configuration
PATCHES_DIR = "patches"
LOG_FILE = "applied_patches.log"
DB_NAME = "your_database"
DB_USER = "your_user"
DB_PASSWORD = "your_password"  # Store securely if possible
DB_HOST = "localhost"
DB_PORT = 5432  # Change for MySQL

def load_applied_patches():
    """ Read the log file and return a set of applied patch filenames. """
    if not os.path.exists(LOG_FILE):
        return set()
    
    with open(LOG_FILE, "r") as f:
        return {line.strip() for line in f}

def save_applied_patch(patch):
    """ Append a new applied patch to the log file. """
    with open(LOG_FILE, "a") as f:
        f.write(patch + "\n")

def get_unapplied_patches(applied_patches):
    """ Get new patches that have not yet been applied. """
    all_patches = sorted(f for f in os.listdir(PATCHES_DIR) if f.endswith(".sql"))
    return [p for p in all_patches if p not in applied_patches]

def apply_patch(patch_file):
    """ Run the SQL patch using psql (PostgreSQL) or mysql (MySQL). """
    patch_path = os.path.join(PATCHES_DIR, patch_file)
    print(f"Applying patch: {patch_file}")

    try:
        result = subprocess.run(
            [
                "psql", 
                "-d", DB_NAME,
                "-U", DB_USER,
                "-h", DB_HOST,
                "-p", str(DB_PORT),
                "-f", patch_path
            ],
            env={"PGPASSWORD": DB_PASSWORD},  # Secure handling is advised
            check=True,
            capture_output=True,
            text=True
        )

        print(result.stdout)
        save_applied_patch(patch_file)
        print(f"Patch {patch_file} applied successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error applying patch {patch_file}: {e.stderr}")

def main():
    """ Main function to manage and apply patches. """
    applied_patches = load_applied_patches()
    unapplied_patches = get_unapplied_patches(applied_patches)

    if not unapplied_patches:
        print("No new patches to apply.")
        return

    for patch in unapplied_patches:
        apply_patch(patch)

if __name__ == "__main__":
    main()
