SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

./build.sh

docker run --rm \
        --network="none" \
        --cap-drop="ALL" \
        --security-opt="no-new-privileges" \
        --shm-size="128m" \
        --pids-limit="256" \
        --gpus='"device=0"' \
        -v /home/konstanzehierl/Desktop/mnt_disk/input:/input/ \
        -v /home/konstanzehierl/Desktop/hybrid_cnn-output:/output/ \
        hybrid_cnn

echo "Evaluation done, checking results" 
