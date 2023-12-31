#!/bin/bash

set -e

export OPENBLAS_NUM_THREADS=1
export FOR_COARRAY_NUM_IMAGES=3

sediment_river_model_1d

readonly target_dist_name=`basename ${PWD}`

cd ../

tar -czvf "${target_dist_name}.tar.gz" "${target_dist_name}/"

mount /mnt/nas_daisuke/

cp "${target_dist_name}.tar.gz" /mnt/nas_daisuke/master_research/ -iv

umount /mnt/nas_daisuke/
