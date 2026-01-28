# Docker WordPress

Clone:
```
git clone https://github.com/agragregra/docker-wordpress .; rm -rf trunk .git
```

Run:
./run.sh {up|down|backup}

Host:
  https://localhost:8888

Install:
  curl -fsSL https://get.docker.com | sudo sh && sudo usermod -aG docker $USER

Start:
  sudo service docker start

## Helpers

Unpack: tar -xzvf
Exec: chmod +x run.sh

In Project Folder:
  sudo chown -R $USER:$USER .

Wipe DB:
  docker compose exec db mysql -u root -proot -e "drop database wp_db; create database wp_db;"
Import DB:
  docker compose exec -T db mysql -u root -p"root" wp_db < dump.sql

wp-config.php:
  $_SERVER['HTTPS'] = 'on';
