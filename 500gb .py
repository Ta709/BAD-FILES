import os
import random
import time

MAIN_DIR = r"C:\VaultOfForeverFiles"
NUM_OUTER_FOLDERS = 1000
NUM_INNER_FILES_PER_FOLDER = 715
RANDOM_WORDS_PER_FILE = 100000

APPROX_BYTES_PER_WORD = 7
APPROX_FILE_SIZE_BYTES = RANDOM_WORDS_PER_FILE * APPROX_BYTES_PER_WORD
APPROX_FOLDER_SIZE_BYTES = NUM_INNER_FILES_PER_FOLDER * APPROX_FILE_SIZE_BYTES
APPROX_TOTAL_SIZE_GB = (NUM_OUTER_FOLDERS * APPROX_FOLDER_SIZE_BYTES) / (1024**3)

try:
    os.makedirs(MAIN_DIR, exist_ok=True)
except Exception as e:
    exit(1)

start_time = time.time()

try:
    for outer_folder_idx in range(1, NUM_OUTER_FOLDERS + 1):
        current_outer_folder_path = os.path.join(MAIN_DIR, str(outer_folder_idx))
        os.makedirs(current_outer_folder_path, exist_ok=True)

        for inner_file_idx in range(1, NUM_INNER_FILES_PER_FOLDER + 1):
            current_file_path = os.path.join(current_outer_folder_path, f"{inner_file_idx}.txt")

            content_lines = [str(random.randint(0, 32767)) for _ in range(RANDOM_WORDS_PER_FILE)]

            with open(current_file_path, 'w') as f:
                f.write('\n'.join(content_lines) + '\n')

except KeyboardInterrupt:
    pass
except Exception as e:
    pass
finally:
    pass