#! bin/bash

Rscript main.R

echo 'Run Tpot from python script'
start_time=$SECONDS
conda run -n Tpot python -W ignore Main.py
elap=$((SECONDS - $start_time))
echo "$elap seconds elapsed"

echo 'Running TPOT directly from commandline'
start_time=$SECONDS
conda run -n Tpot tpot IRIS.csv -is , -target Species -o tpot_exported_pipeline.py -g 2 -sub 0.25 -p 10 -cv 5 -s 42 -v 2
elap=$((SECONDS - $start_time))
echo "$elap seconds elapsed"
