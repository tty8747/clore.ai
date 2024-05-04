FROM alpine/curl:latest AS builder

# curl -s "https://api.github.com/repos/3DP-The-AllFather/xelis-gpu-miner/releases/latest" | jq '.tag_name' | tr -d '"|[A-Za-z]'
# curl -s "https://api.github.com/repos/3DP-The-AllFather/xelis-gpu-miner/releases/latest" | awk -F'"' '/  "tag_name":/{print $4}'
    
WORKDIR /build
RUN VERSION=$(curl -s "https://api.github.com/repos/3DP-The-AllFather/xelis-gpu-miner/releases/latest" | awk -F'"' '/  "tag_name":/{print $4}') \
    && curl -LO https://github.com/3DP-The-AllFather/xelis-gpu-miner/releases/download/$VERSION/xelis-taxminer \
    && chmod +x xelis-taxminer

FROM cloreai/ubuntu20.04-jupyter:latest

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES all

COPY --from=builder /build/xelis-taxminer /app
CMD ["bash", "-c", "/app/xelis-taxminer --host pi.home:8080 --wallet xel:kpwvqxx53h4t53d0cuf439hp2ms47dmamprutlzykagn37ed4gcsqvnkgm9 --boost --worker gpucypress"]
