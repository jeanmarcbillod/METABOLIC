tar zxvf Accessory_scripts.tgz; rm Accessory_scripts.tgz
tar zxvf METABOLIC_hmm_db.tgz;  rm METABOLIC_hmm_db.tgz
tar zxvf METABOLIC_template_and_database.tgz; rm  METABOLIC_template_and_database.tgz
tar zxvf Motif.tgz; rm Motif.tgz
mkdir kofam_database  
cd kofam_database  
curl --silent ftp://ftp.genome.jp/pub/db/kofam/ko_list.gz  -O ko_list.gz
curl --silent ftp://ftp.genome.jp/pub/db/kofam/profiles.tar.gz  -O profiles.tar.gz
gzip --quiet -d ko_list.gz  
tar xzf profiles.tar.gz; rm profiles.tar.gz  
mv ../All_Module_KO_ids.txt profiles
cd profiles  
cp ../../Accessory_scripts/batch_hmmpress.pl ./  
perl batch_hmmpress.pl
cd ../
cd ../
mkdir dbCAN2
cd dbCAN2
wget https://bcb.unl.edu/dbCAN2/download/Databases/dbCAN-old@UGA/dbCAN-fam-HMMs.txt.v10  -O dbCAN-fam-HMMs.txt
perl ../Accessory_scripts/batch_hmmpress_for_dbCAN2_HMMdb.pl
cd ../
mkdir MEROPS
cd MEROPS
wget ftp://ftp.ebi.ac.uk/pub/databases/merops/current_release/pepunit.lib
perl ../Accessory_scripts/make_pepunit_db.pl
cd ../
gdown --quiet https://drive.google.com/file/d/1t1dwSJXuuaRpH3d1_xJAJkGdT4W8IOMw/view?usp=drive_link --fuzzy
tar zxvf METABOLIC_test_files.tgz
rm *.tgz
