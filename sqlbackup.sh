#script auto backup database

#database config
#change ubuntu to your username
user=root
pass=password
host=localhost
dir=/home/ubuntu/auto-backup-database



backup(){
  date=$(date +%Y%m%d-%H%M)
  dd=$(date +%d)
  mm=$(date +%m)
  yy=$(date +%Y)
  if [ ! -d "$dir/$yy/$mm/$dd/" ];
    then mkdir --parents $dir/$yy/$mm/$dd;
  fi
  dump=/usr/bin/mysqldump
  $dump $dbs -u$user -p$pass -h$host -R -K --triggers > $dir/$yy/$mm/$dd/$dbs-$date.sql
  gzip -f $dir/$yy/$mm/$dd/$dbs-$date.sql
}


#change `demo` to your database name
database="demo"
for dbs in $database
do
backup
done
cd /home/ubuntu/auto-backup-database
git add .
git commit -m "$yy/$mm/$dd/$dbs-$date.sql"
git push
exit 0

#this command will remove database backup more than 30 days
rm `find /home/ubuntu/auto-backup-database/ -mtime +30`