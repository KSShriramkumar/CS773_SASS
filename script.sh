#!/bin/bash

TRACE_DIR="../../../../../../../MICRO/ICS/traces"
TRACES=("pr-3.trace.gz" "pr-5.trace.gz" "pr-10.trace.gz" "pr-14.trace.gz")
BINS=("coverage_-1" "coverage_-2" "coverage_0" "coverage_1" "coverage_2")

for TRACE in "${TRACES[@]}"; do
    for BIN in "${BINS[@]}"; do 
        mkdir -p "Results/$BIN"  # Make sure the result directory exists for each BIN
        ./bin/final/$BIN --warmup_instructions 40000000 --simulation_instructions 100000000 "$TRACE_DIR/$TRACE" "$TRACE_DIR/$TRACE" > "Results/$BIN/log_summary_${TRACE}_${BIN}" &
    done
done

wait  # Wait for all background processes to finish before exiting
