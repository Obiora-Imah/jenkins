#/bin/bash
echo "parameters: host, passsword, dbname, aws_access_secret"


DATE=$(date +%Y-%m-%d-%H-%M)
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
mysqldump -u root --column-statistics=0 -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/db-$DATE.sql && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
export AWS_ACCESS_KEY_ID=AKIAY6GW5UJQDJOXH26U

aws s3 cp /tmp/db-$DATE.sql s3://obiora-jenkins-mysql-backup/db-$DATE.sql
