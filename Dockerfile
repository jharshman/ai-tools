from opensuse/leap:15.6
run zypper in -y vi npm tar gzip
run useradd -m -d /mnt/aiuser aiuser
run npm install -g @anthropic-ai/claude-code

# todo: also setup cursor
# run curl https://cursor.com/install -fsS | sh

