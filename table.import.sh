#!/bin/bash
#
#

BASE="/backup/mysql/"
LISTFILES=`find $BASE -type f -name *.sql.gz`
EXCLUDEDIR="mysql"

time for i in $LISTFILES

        do

	DATABASE=`ls $i |cut -d "." -f1 |cut -c 15- |cut -d "/" -f1`

        TABLE=`ls $i |cut -d "." -f1 |cut -c 15- |cut -d "/" -f2`

        echo "IMPORTING $TABLE INTO $DATABASE" 
        echo "---"

        /bin/gunzip < $i | /usr/bin/mysql --defaults-extra-file=/etc/mysql/debian.cnf $DATABASE 

done

echo ""
echo "Table import completed!"
echo ""

# EOF
