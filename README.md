# Docker WordPress

Clone:
```
git clone https://github.com/agragregra/docker-wordpress .; rm -rf trunk .git
```

Install Docker:
```
curl -fsSL https://get.docker.com | sudo sh && sudo usermod -aG docker $USER
```

Start Docker:
```
sudo service docker start
```

Permissions:
```
chmod +x run.sh
sudo chown -R $USER:$USER .
```

Run:
```
./run.sh {up|down|backup}
```

Host: https://localhost:8888

wp-config.php (SSL):
```
$_SERVER['HTTPS'] = 'on';
```

## Helpers

Unpack
```
set -- *.tar.gz; tar -xf "$1"
```

Recreate DB:
```
docker compose exec db mysql -u root -proot -e "drop database wp_db; create database wp_db;"
```

Import DB:
```
docker compose exec -T db mysql -u root -p"root" wp_db < dump.sql
```

View/Remove Images:
```
docker images -a
docker rmi -f $(docker images -a -q)
```

Configuring add & remove plugins from the admin panel (Docker):
Settings in wp-config.php:
```
define('FS_METHOD', 'direct');
```
Permissions:
```
sudo chown -R www-data:www-data .
```
