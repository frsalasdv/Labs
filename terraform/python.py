import os, time, json, shutil, git, subprocess, sys
from distutils.dir_util import copy_tree

CONFIG_FILE_NAME  = "/var/tmp/source/hotfix/hotfix-config.json"
STATE_FILE_NAME   = "/var/tmp/state.json"
COMMIT_FILE_NAME  = "/var/tmp/commit.json"
SOURCE_DIR        = '/var/tmp/source/hotfix/'
TMP_DIR           = '/var/tmp/tmp/'
SINK_DIR          = '/etl/ttu/edwmx/'
GIT_FOLDER        = '/var/tmp/source/'

def read_file(file_name):
    with open(file_name) as file:
        data = json.load(file)
    return data

def modify_state(commit):
    with open(STATE_FILE_NAME, 'wt') as file:
        json.dump({'last_commit': commit}, file)

def modify_commit(commit):
    with open(COMMIT_FILE_NAME, 'wt') as file:
        json.dump({'commit': commit}, file)

def get_git_revision_short_hash() -> str:
    return subprocess.check_output(['git', 'rev-parse', '--short', 'HEAD'],cwd=GIT_FOLDER).decode('ascii').strip()

g = git.cmd.Git(GIT_FOLDER)
g.pull()

modify_commit(get_git_revision_short_hash())

if __name__ == "__main__":
    state  = read_file(file_name=STATE_FILE_NAME)
    commit = read_file(file_name=COMMIT_FILE_NAME)
    config = read_file(file_name=CONFIG_FILE_NAME)

    if config.get('hotfix') and (commit.get('commit') != state.get('last_commit')):
        sys.stdout = open("hotfix_" + config.get('Change_Request') + ".log", 'a')
        if os.path.exists(TMP_DIR):
            shutil.rmtree(TMP_DIR)
        tmp_copy = shutil.copytree(SOURCE_DIR,TMP_DIR)
        for excluded_file_path in config.get('exclude'):
            r = os.remove(f"{TMP_DIR}{excluded_file_path}")
        sink_copy = copy_tree(TMP_DIR,SINK_DIR)
        print(f"Copied to application folder: {sink_copy}")
        modify_state(commit=commit.get('commit'))
        print ("Hotfix Commit  : " + commit.get('commit'))
        print(f"List of files (location/permission/date) ")
        os.system('chown -R pedguser. /etl  ')
        os.system('chmod -R 755 /etl  ')
        for file2 in sink_copy:
            result = subprocess.run(["ls","-l","-a","-h", file2], stdout=subprocess.PIPE)
            print(result.stdout)
        sys.stdout.close()
        os.system('gsutil cp hotfix_' + config.get('Change_Request') + '.log gs://uat-terraform-backends')

    else:
        print("No hotfix commit detected; the application folder will remain the same.")
