#!/bin/bash

# 设置你的 Go 项目名称和版本
project_name="huggingface_go"
project_version="v6"

# 定义目标平台和架构的数组
platforms=("windows" "linux" "darwin")
architectures=("amd64" "386" "arm")

# 编译并为每个目标平台和架构生成可执行文件
for platform in "${platforms[@]}"; do
    for architecture in "${architectures[@]}"; do
        output_name="${project_name}_${platform}_${architecture}_${project_version}"

        echo "Compiling for $platform $architecture"
        
        # 使用 Go 编译
        export GOOS="$platform"
        export GOARCH="$architecture"
        if [ "$platform" == "windows" ]; then
            go build -o "$output_name.exe"
        else
            go build -o "$output_name"
        fi

        echo "Compilation for $platform $architecture completed."
    done
done

echo "All compilations completed."
