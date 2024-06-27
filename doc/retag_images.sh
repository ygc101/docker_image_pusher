#!/bin/bash

# 读取 images.txt 文件
while IFS= read -r line
do
  # 原始镜像名和版本号
  original_image=$(echo $line | cut -d: -f1)
  original_tag=$(echo $line | cut -d: -f2)

  # 新镜像名和版本号
  ali_image="registry.cn-hangzhou.aliyuncs.com/your-namespace/$(basename $original_image)"
  ali_tag=$original_tag

  # 重新标记镜像
  docker tag "$ali_image:$ali_tag" "$original_image:$original_tag"
  echo "Retagged $ali_image:$ali_tag to $original_image:$original_tag"
done < images.txt
