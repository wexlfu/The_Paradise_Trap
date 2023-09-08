#!/bin/bash
PLANNED="$(grep -o '\<S:[0-9]*\>' story.md | cut -d: -f2 | paste -sd+ - | bc)"
CUTSCENE="$(grep -o '\<C:[0-9]*\>' story.md | cut -d: -f2 | paste -sd+ - | bc)"
DONE="$(grep -o '\<D:[0-9]*\>' story.md | cut -d: -f2 | paste -sd+ - | bc)"
MEDALS="$(grep -o '\<M:[0-9]*\>' story.md | cut -d: -f2 | paste -sd+ - | bc)"

wvar META_SCENARIOS "$PLANNED"
wvar META_SCENARIOS_DONE "$DONE"
wvar META_MEDALS "$MEDALS"
