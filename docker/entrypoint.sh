#!/bin/sh

./docker/wait-for.sh $DB_HOST:5432 -- echo "Postgres Engine is up"

rails db:exists && rails db:migrate:with_data || rails db:create db:migrate:with_data


puma -C config/puma.rb