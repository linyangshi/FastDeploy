#!/bin/bash
set +e
set +x

download_fd_model_zxvf() {
  local model="$1"  # xxx_model.tgz
  local len=${#model}
  local model_dir=${model:0:${#model}-4}  # xxx_model
  if [ -d "${model_dir}" ]; then
     echo "[INFO] --- $model_dir already exists!"
     return
  fi
  if [ ! -f "${model}" ]; then
     echo "[INFO] --- downloading $model"
     wget https://bj.bcebos.com/paddlehub/fastdeploy_paddlex_2_0/$model && tar -zxvf $model
     # remove tar crash
     rm $(ls ./${model_dir}/._*)
  else
     echo "[INFO] --- $model already exists!"
     if [ ! -d "${model_dir}" ]; then
        tar -zxvf $model
        rm $(ls ./${model_dir}/._*)
     else
        echo "[INFO] --- $model_dir already exists!"
     fi
  fi
}
download_fd_model_xvf() {
  local model="$1"
  local model_dir=${model:0:${#model}-4}  # xxx_model
  if [ -d "${model_dir}" ]; then
     echo "[INFO] --- $model_dir already exists!"
     return
  fi
  if [ ! -f "${model}" ]; then
     echo "[INFO] --- downloading $model"
     wget https://bj.bcebos.com/paddlehub/fastdeploy_paddlex_2_0/$model && tar -xvf $model
     rm $(ls ./${model_dir}/._*)
  else
     echo "[INFO] --- $model already exists!"
     if [ ! -d "${model_dir}" ]; then
        tar -xvf $model
        rm $(ls ./${model_dir}/._*)
     else
        echo "[INFO] --- $model_dir already exists!"
     fi
  fi
}
download_common_model_zxvf() {
  local model_url="$1"
  local model="$2"
  local model_dir=${model:0:${#model}-4}  # xxx_model
  if [ -d "${model_dir}" ]; then
     echo "[INFO] --- $model_dir already exists!"
     return
  fi
  if [ ! -f "${model}" ]; then
     echo "[INFO] --- downloading $model"
     wget ${model_url} && tar -zxvf $model
     rm $(ls ./${model_dir}/._*)
  else
     echo "[INFO] --- $model already exists!"
     if [ ! -d "${model_dir}" ]; then
        tar -zxvf $model
        rm $(ls ./${model_dir}/._*)
     else
        echo "[INFO] --- $model_dir already exists!"
     fi
  fi
}
download_common_model_xvf() {
  local model_url="$1"
  local model="$2"
  local model_dir=${model:0:${#model}-4}  # xxx_model
  if [ -d "${model_dir}" ]; then
     echo "[INFO] --- $model_dir already exists!"
     return
  fi
  if [ ! -f "${model}" ]; then
     echo "[INFO] --- downloading $model"
     wget ${model_url} && tar -xvf $model
     rm $(ls ./${model_dir}/._*)
  else
     echo "[INFO] --- $model already exists!"
     if [ ! -d "${model_dir}" ]; then
        tar -xvf $model
        rm $(ls ./${model_dir}/._*)
     else
        echo "[INFO] --- $model_dir already exists!"
     fi
  fi
}
download_common_file() {
  local file_url="$1"
  local file="$2"
  if [ ! -f "${file}" ]; then
     echo "[INFO] --- downloading $file_url"
     wget ${file_url}
  else
     echo "[INFO] --- $file already exists!"
  fi
}


download_fd_model_zxvf ocrnet_hrnetw48.tgz 
download_fd_model_zxvf picodet_s_320_lcnet.tgz