#!/bin/bash

# remember this script runs as root

# if else statement checking for operating system package manager: yum or apt-get e.g

echo "updating machine..."
yum update -y
yum upgrade -y

echo "installing git..."
yum install git -y

echo "installing gitlab server key..."
touch /root/.ssh/known_hosts
cat << 'EOF' >> /root/.ssh/known_hosts
gitlab.cs.cf.ac.uk,131.251.168.40 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBDQcOCOPLUQCRGrioWbPcxxCsqGOIj2wbP9MiE14Oc7KeLYbRwBtlHImq4k8f0tgI3qejeSnXl2y3jbFAmnttXY=
EOF
chmod 644 /root/.ssh/known_hosts

echo "installing gitlab repository key for tokyo repository..."
touch /root/distribution_key_tokyo.key
cat << 'EOF' >> /root/distribution_key_tokyo.key
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEApTFr8ywJJK8BNilSgsL8MqSTjB2T5pinqW6a0fShfw0hDUsh
hM96ZNx1xZr880UOsQ51PtKrLs62Ta6VUSJHvcrJC6rWM1HVWnxlCogLUZyn9Eo7
E4qzlImwKCPs9kq1N+TpKuxPYZP0xRpB3cBG8Is7Ne81+QwajLrJMTjaZdv8x2HF
ekE5UaDUkEcQY6stjMNmM9vwhkJGdQ7dM2pxlH0YuLS1D2f3qSFbidN4It9ZE63m
9HgprvtZYI/mrtmZIlOGnpBR7OVW8D+cu6Fc41ZJL3AxkX9rQBS3Lo6uKDp5bzVS
Q1IarcEV6mkmvmtZX7Pkosqbpu2MP7zjIjXhSwIDAQABAoIBADIwuePAVWbX5T5X
f8JLC+U3K70+n1lIuGg6Or/f29GGY6xuT1jS0RUkBoRrer9PFA+nnOfhijFGjQ09
JhDooXOA0WTCGyKskm5TrT9t5kJ9nmoSw7BETButWeBYSf7q4/R/kHiCI/w5v/zC
5ZBCg0tCglL4wyVQECEB/279Hx4jI4nL1y1uQWigdeDzmBAaSzQ+JjsH9ffjshxr
4sw1oDhJ4PYUJ38MKpjOnPsGFDIqp0PIrHxAdD9N6+Ehwm5XYhLhZRfsRxv8TL8n
phr0kSeycyznrb8HSDLF2qTuHHyeFbdUllhCqINGRZNWachGeQ6ZQB3Mf4clTpqQ
R9PqTUECgYEA20nf9X5ZOf+qiAwOD5kZj8DcgtB+RP5yKW+nGMEkrAt7Xlyixc1K
U4S6RJ18hdRkcEcrYRMSsyhheGz9UyCtPt3veoi/SVlPtT4MiTt7ecgVbyoljxNh
K2DlJ73bzGB0c3Ut2u8kwKb1h0MtGS3CjdekqkRkgGQm/MMoHTO8ST0CgYEAwNko
HMxr3oZKPuv7YaGAFsUYoxcSkygJK7o+8efuL+laRJgR9z1WZQeWosgYoL3IB8cP
OMfTTZf0jcGDg5ym8pALsnvUIatMsyL45ZhIs4ikYEBlIvjcBbvUXQG2DVrR0kZr
Q1NxvRmh/m7sRsSYu6CCO9ImyJ+W3af/z9qzLScCgYAYfwsmqGOdSAMryXT0pxyk
411+u32vhWEJYfCfokvPcETqyJxiTkmEROpt6c3UQWKq7DhbUr8fBl7FDh/KXncb
87zhyk7cCb8Otwy9c8iaVRCX53RkpDyRlPRkWSApl4jKsQdbUqWfY8c/wfBSxLrc
D3/UiWlUsltslvxvLq1U3QKBgEkC7jjY/A3ncbyYwzeXWVNFk6pLVfD4u2Aexy32
zSq+gjpuCH8+bbMaSGGguBJDR7QKHS02Gj3KRgBVP2FYsawr9QHB9/I3VHaNywXB
veSa2wDF4IR5C3PwRNphh3dO5xlhJ8L5mJorVjVp8XJphBmlDyluytgx84A/1o3v
Et8JAoGBAK95DZdn1UgWlA5nwiMwFuqmHNbWQLf036V2Y4e9e+ay9PTGVFlL+9PW
DjPH7i+EDHYh+Ps2s1w9ClSJkstMF8gDAXpgYgTsT822bVvJ7NRRk/ZxHh+gYjFT
Bt8zq4YvaKHmbwbHjCE3OfUfB9hGfjAI3F7+bfz37ABqFzR/S+/u
-----END RSA PRIVATE KEY-----
EOF
chmod 400 /root/distribution_key_tokyo.key

echo "changing to root directory..."
cd root

# the key just needs to match
echo "cloning repository..."
ssh-agent bash -c 'ssh-add /root/distribution_key_tokyo.key; git clone git@gitlab.cs.cf.ac.uk:c1575287/tokyo.git'
