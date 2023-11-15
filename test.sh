SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

./build.sh

docker run --rm \
        --network="none" \
        --cap-drop="ALL" \
        --security-opt="no-new-privileges" \
        --shm-size="128m" \
        --pids-limit="256" \
        --gpus='"device=1"' \
        -v /mnt/rcbe-srv-015/Students/hik37564/FDG_PETCT/for_AutoPet/input/:/input/ \
        -v /mnt/rcbe-srv-015/Students/hik37564/FDG_PETCT/for_AutoPet/hybrid_cnn-output:/output/ \
        hybrid_cnn

echo "Evaluation done, checking results" 
