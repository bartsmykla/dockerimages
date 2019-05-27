#!/usr/bin/env bash

function parse_args {
  # positional args
  args=()

  # named args
  while [ "$1" != "" ]; do
      case "$1" in
          -i | --images-path )          images_path="$2";        shift;;
          -u | --docker-username )      docker_username="$2";    shift;;
          * )                           args+=("$1")             # if no match, add it to the positional args
      esac
      shift # move to next kv pair
  done

  # restore positional args
  set -- "${args[@]}"

  # set defaults
  if [[ -z "${images_path}" ]]; then
      images_path="./images";
  fi

  if [[ -z "${docker_username}" ]]; then
      docker_username="bartsmykla";
  fi
}

parse_args "$@"

for image in "${images_path}"/*
do
    image="$(basename "${image}")"
    docker build \
        -t ${docker_username}/"${image}":"$(cat ${images_path}/"${image}"/VERSION)" \
        -f ${images_path}/"${image}"/Dockerfile \
        .
    docker push ${docker_username}/"${image}":"$(cat ${images_path}/"${image}"/VERSION)"
done