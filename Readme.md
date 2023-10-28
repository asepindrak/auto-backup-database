## AUTO BACKUP DATABASE

### navigate to directory

#### (change ubuntu to your username)
```bash
cd /home/ubuntu
```

### clone repository
```bash
git clone https://github.com/username/auto-backup-database.git
```

### chmod sqlbackup.sh
```bash
chmod +x /home/ubuntu/auto-backup-database/sqlbackup.sh
```

### edit crontab
```bash
crontab -e
```

### add this cronjob
```
1 1 * * * /home/ubuntu/auto-backup-database/sqlbackup.sh >/dev null 2>&1
```

### reload cronjob
```bash
sudo service cron reload
```


### edit file sqlbackup.sh
 - change database credential


### testing
```bash
./home/ubuntu/auto-backup-database/sqlbackup.sh
```


- don't forget to setup github action