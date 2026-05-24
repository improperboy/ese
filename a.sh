#!/bin/bash

# 1. Create files in docs/ and images/
for i in $(seq 1 15); do
  touch /home/ubuntu/workspace/docs/doc${i}.txt
done

for i in $(seq 1 25); do
  touch /home/ubuntu/workspace/images/img${i}.txt
done

# 2. Set permissions for docs/
for i in $(seq 1 15); do
  if (( i % 3 == 0 )); then
    # Selected (divisible by 3): Owner=rwx, Group=x, Public=rw => 716
    chmod 716 /home/ubuntu/workspace/docs/doc${i}.txt
  else
    # Not Selected: Owner=rw, Group=-, Public=r => 604
    chmod 604 /home/ubuntu/workspace/docs/doc${i}.txt
  fi
done

# 3. Set permissions for images/
for i in $(seq 1 25); do
  if (( i % 3 == 0 )); then
    # Selected (divisible by 3): Owner=rw, Group=r, Public=x => 641
    chmod 641 /home/ubuntu/workspace/images/img${i}.txt
  else
    # Not Selected: Owner=r, Group=w, Public=- => 420
    chmod 420 /home/ubuntu/workspace/images/img${i}.txt
  fi
done

echo "Done!"
