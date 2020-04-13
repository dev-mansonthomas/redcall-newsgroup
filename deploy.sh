#!/usr/bin/env bash

gcloud config set project  pegass-ggroup-sync

# shellcheck source=/Users/thomasmanson/.cred/CRF-newsgroup-setup.properties
. ~/.cred/CRF-newsgroup-setup.properties

cp app.yaml.dist app.yaml

sed -i '' -e "s/¤PEGASS_LOGIN¤/${PEGASS_LOGIN}/g"                   app.yaml
sed -i '' -e "s/¤PEGASS_PASSWORD¤/${PEGASS_PASSWORD}/g"             app.yaml
sed -i '' -e "s/¤TOKEN_MANUAL_TRIGGER¤/${TOKEN_MANUAL_TRIGGER}/g"   app.yaml
sed -i '' -e "s/¤UL_ID¤/${UL_ID}/g"                                 app.yaml
sed -i '' -e "s/¤MAILING_LIST¤/${MAILING_LIST}/g"                   app.yaml

#Private key for using API
cp ~/.cred/pegass-ggroup-sync-*.json ./pegass-ggroup-sync.json

gcloud app deploy -q

rm app.yaml
echo "" > ./pegass-ggroup-sync.json